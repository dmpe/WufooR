#' @title Authentication
#'
#' @description A method for setting your Wufoo Name and API Key. Your Wufoo name is the subdomain
#' of your Wufoo URL displayed in "Account" tab. For example, for \code{http://johnmalc.wufoo.com},
#' the \code{Wufoo_Name = "johnmalc"}. This can be the company's name too, e.g. \code{http://google.wufoo.com}
#'
#' Your API key may be found by selecting "Share" of your form, then
#' "API Information" (or go to \code{https://yourName.wufoo.com/api/code/1/}.
#'
#' @author The code for these methods has been developed by Scott Chamberlain \url{https://github.com/sckott} for his
#' \url{https://github.com/ropensci/rnoaa} package.
#'
#' @param x - an empty parameter, e.g. NULL
#'
#' @note Wufoo currently restricts free API usage to 100 requests per day.
#'
#' @examples
#' options(Wufoo_Name = "johnmalc", Wufoo_API = "F1QH-Q64B-BSBI-JASJ")
#' @export
auth_name <- function(x) {
  tmp <- if (is.null(x)) {
    Sys.getenv("Wufoo_Name", "")
  } else {
    x
  }
  if (tmp == "") {
    getOption("Wufoo_Name", stop("you need to set up your Wufoo name"))
  } else {
    tmp
  }
}

#' @rdname auth_name
#' @export
auth_key <- function(x) {
  tmp <- if (is.null(x)) {
    Sys.getenv("Wufoo_API", "")
  } else {
    x
  }

  if (tmp == "") {
    getOption("Wufoo_API", stop("you need to set up your Wufoo API key"))
  } else {
    tmp
  }
}

#' @title Generalized function for executing GET requests by appending user's API Key.
#'
#' @param url - which is used for the request
#' @param apiKey - uses the passed api key of the user
#' @param queryParameters - parameters that are used for building a URL
#' @param showURL - for debugging purposes only: it shows what URL has been called
#' @param debugConnection - same as above
#'
#' @import httr jsonlite
#'
#' @noRd
doRequest <- function(url, queryParameters = NULL, apiKey = auth_key(NULL), showURL = NULL, debugConnection = 0L) {
  if (is.null(apiKey)) {
    stop("Please assign your API Key", call. = FALSE)
  } else {

    # https://github.com/wufoo/Wufoo-PHP-API-Wrapper/blob/master/WufooApiWrapperBase.php#L102
    # http://curl.haxx.se/libcurl/c/CURLOPT_SSL_VERIFYHOST.html
    # https://stackoverflow.com/questions/28622558/how-to-solve-error-ssl23-get-server-hellosslv3-alert-handshake-failure

    if (.Platform$OS.type == "windows") {
      getResponse <- GET(url,
        query = queryParameters,
        config(
          userpwd = paste0(apiKey, ":fakepassword"), ssl_cipher_list = "TLSv1",
          ssl_verifypeer = 0L, ssl_verifyhost = 0L, followlocation = 1L,
          verbose = debugConnection
        )
      )
    } else {
      getResponse <- GET(url,
        query = queryParameters,
        config(
          userpwd = paste0(apiKey, ":fakepassword"),
          ssl_verifypeer = 0L, ssl_verifyhost = 0L, followlocation = 1L,
          verbose = debugConnection
        )
      )
    }
    stop_for_status(getResponse)
    rawTextResponse <- content(getResponse, as = "text")

    if (grepl("application/json", getResponse$headers$`content-type`)) {
      response <- fromJSON(rawTextResponse)
    } else {
      response <- rawTextResponse
    }

    if (identical(showURL, TRUE)) {
      cat("The requested URL has been this: ", getResponse$url, "\n")
    }

    return(response)
  }
}


#' Retrieve API Key on behalf of users
#'
#' This request allows approved partners to access users API Keys.
#' This is useful for custom integrations that need to make API requests on
#' behalf of Wufoo users. For example, Zapier uses this method to set up new integrations,
#' without requiring users to use or even know their own API Key.
#'
#' @inheritParams report_fields
#' @param apiKey - uses the passed api key of the user
#' @param integrationKey - Required. This is your Login integration key. Apply at \url{https://master.wufoo.com/forms/integration-key-application/}
#' @param email - Required. The user's email, which acts as the identifier for their account.
#' @param password - Required. The user's password
#' @param subdomain - Optional. The user's subdomain. Is required if the email belongs to a sub-user or the email address is used on multiple accounts.
#'
#' @note This method has not been tested. Please report bugs in GitHub Issues
#'
#' @note This method will not work unless you are one of Wufoo's exclusive partners.
#'
#' @return \url{https://wufoo.github.io/docs/#retrieve-api-key}
#'
#' @export
retrieve_api_key <- function(integrationKey = NULL, email = NULL, password = NULL, apiKey = auth_key(NULL),
                             subdomain = NULL, showRequestURL = FALSE,
                             debugConnection = 0L, domain = "wufoo.com") {
  post_url <- paste0("https://", domain, "/api/v3/login.json")

  query <- list(
    integrationKey = integrationKey, email = email,
    password = password, subdomain = subdomain
  )

  if (.Platform$OS.type == "windows") {
    getResponse <- POST(post_url,
      body = query, content_type_json(),
      config(
        userpwd = paste0(apiKey, ":fakepassword"), ssl_cipher_list = "TLSv1",
        ssl_verifypeer = 0L, ssl_verifyhost = 0L, followlocation = 1L, verbose = debugConnection
      )
    )
  } else {
    getResponse <- POST(post_url,
      body = query, content_type_json(),
      config(
        userpwd = paste0(apiKey, ":fakepassword"),
        ssl_verifypeer = 0L, ssl_verifyhost = 0L, followlocation = 1L, verbose = debugConnection
      )
    )
  }
  stop_for_status(getResponse)
  rawTextResponse <- content(getResponse, as = "text")

  if (grepl("application/json", getResponse$headers$`content-type`)) {
    response <- fromJSON(rawTextResponse)
  } else {
    response <- rawTextResponse
  }

  if (identical(showRequestURL, TRUE)) {
    cat("The requested URL has been this: ", getResponse$url, "\n")
  }

  return(response)
}
