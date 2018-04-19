
library(wooldridge)

# Load data
data("attend")

# create plot, add labels, theme, and loess smoother
library(ggplot2)
Graph <- ggplot(attend, aes(x = atndrte, y = termGPA)) + 
                geom_point() + 
                geom_smooth(se = FALSE, color = "purple") +
                labs(x="Percent Meetup Attendance", 
                     y="Final Grade in R skills") +
                theme_void() + 
                theme_transparent()

# create hex sticker
library(hexSticker)
sticker(Graph, package="CRUGtools", p_size=26, s_x=1, s_y=0.80, s_width=1.3, 
        s_height=1, filename="vignettes/images/CRUGtools.png")
