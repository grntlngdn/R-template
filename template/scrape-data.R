library(rvest)

url = ""
dest_file = "rdas/[Subject].rda"

[Subject] = read_html(url) %>%
  html_nodes("") %>%
  .[[]]
[Subject]

write_xml([Subject], file = dest_file)
browseURL(dest_file)


#This next bit is useful in the wrangle-data script for projects using scraping
[Subject] %>%
  html_table() %>%
  .[[1]] %>%
  setNames(c())