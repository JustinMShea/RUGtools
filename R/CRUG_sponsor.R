# CRUG_sponsor.R

library(imager)
# CRUG logo from here
# https://github.com/Chicago-R-User-Group/Chicago-R-User-Group.github.io/blob/master/images/header-background.png
im <- load.image("header-background.png")
plot(im)

# IBM logo from here
# https://pngimg.com/image/19662
im2 <- load.image("ibm_PNG19662.png")
im3 <- imresize(im2,.06)

png(filename = "CRUG_IBM.png", width = 3632, height = 1376)
plot(imdraw(im, im3, x = 100, y = 1050, opacity = 1), axes = FALSE)
text("Sponsored by", y = 1000, x = 175, cex = 4)
dev.off()

# Output available here:
# https://github.com/Chicago-R-User-Group/Chicago-R-User-Group.github.io/blob/master/images/CRUG_IBM.png
