url = ""
dest_file = "data/[Subject].csv"
download.file(url, destfile = dest_file)
read_lines(dest_file, n_max = 5)
