#' A getout function
#' This function allows you to extract outlinks for a given user with customized user agent
#' @param url URL that need to analyzed Defaults to http://datafireball.com
#' @keywords xml html useragent outlinks crawl
#' @export
#' @examples
#' getout()

# http://stackoverflow.com/questions/7269006/r-xml-package-how-to-set-the-user-agent

getout <- function(url="http://datafireball.com", useragent="R Statistics"){
  html <- RCurl::getURLContent(url, useragent=useragent, followlocation=TRUE)
  doc <- XML::htmlParse(html, asText=TRUE)
  outlinks <- XML::getHTMLLinks(doc)
  outlinks <- outlinks[grepl('://', outlinks)]
  return(outlinks)
}
