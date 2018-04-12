
library(wooldridge)
data("attend")

# create plot 
library(ggplot2)
Graph <- ggplot(attend, aes(x = atndrte, y = termGPA))  

# add labels, theme, and loess smoother
Graph + geom_point() + 
        geom_smooth() +
        labs(x="Percent Meetup Attendance", 
              y="Final Grade in R skills") +
        theme_classic()

## or use a linear model cubic spline
Graph + geom_point() + 
        geom_smooth(method = "lm", formula = y ~ splines::bs(x, 3)) +
        labs(x="Percent Meetup Attendance", y="Final Grade in R skills") +
        theme_classic()

## use magick package to store graph as image and overlay logos
library(magick)

attend_graph <- image_graph(width = 600, height = 338)
                Graph + geom_point() + 
                geom_smooth(method = "lm", formula = y ~ splines::bs(x, 3)) +
                labs(x="Percent Meetup Attendance", y="Final Grade in R skills") +
                theme_classic()
                dev.off()
                
# main page header: attedance image and R logo

RlogoWWW <- image_read("https://www.r-project.org/logo/Rlogo.png")

RlogoWWW_resize <- image_resize(RlogoWWW, "600x338")

CRUG_header <- image_composite(attend_graph, image_scale(RlogoWWW, "x160"), offset="+40+10")

image_write(CRUG_header, path = "vignettes/images/CRUG_Header.png", format = "png")


# microsoft developer advocate header: attend_graph image and devAdvocate logo 

MS_logo <- image_read(paste0(getwd(),"/vignettes/images/BitDevAdvocate.png"))

# combine with R logog

MS_R <- c(MS_logo,RlogoWWW)

MS_header <- image_append(image_scale(MS_R, "338"))

image_write(MS_header, path = "vignettes/images/MS_header.png", format = "png")

# combined header: attend_graph, R, and MS logos

MS_CRUG_header <- image_composite(attend_graph, image_scale(MS_header, "x120"), offset="+40+10")

image_write(MS_CRUG_header, path = "vignettes/images/MS_CRUG_header.png", format = "png")
