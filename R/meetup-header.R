library(magick)

# main page header: attedance image and R logo
RlogoWWW <- image_read("https://www.r-project.org/logo/Rlogo.png")
RlogoWWW_resize <- image_resize(RlogoWWW, "600x338")

MS_logo <- image_read(path.expand("~/R-CRUG/images/BitDevAdvocate.png"))

Attend <- image_read(path.expand("~//R-CRUG/images/Attend600x338.png"))
CRUG_header <- image_composite(Attend, image_scale(RlogoWWW, "x160"), offset="+40+10")

# microsoft developer advocate header: Attend image and devAdvocate logo 
MS_logo <- image_read(path.expand("~/R-CRUG/images/BitDevAdvocate.png"))
MS_header <- image_composite(Attend, image_scale(RlogoWWW, "x20"), image_scale(MS_logo, "x160"), offset="+40+10")

img <- c(MS_logo,RlogoWWW)
MS_header <- image_append(image_scale(img, "338"))

image_write(MS_header, path = "images/MS_header.png", format = "png")

# combined header: Attend, R, ms logos
MS_CRUG_header <- image_composite(Attend, image_scale(MS_header, "x120"), offset="+40+10")

image_write(MS_CRUG_header, path = "images/MS_CRUG_header.png", format = "png")
