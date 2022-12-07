## function to create linear model figure 
plot_penguin_figure <- function(penguins_mass_and_flippers){
  penguins_mass_and_flippers %>%
    ggplot(penguins_mass_and_flippers, mapping = aes(x = body_mass_g, y = flipper_length_mm)) +
    geom_point(size = 1) +
    geom_smooth(method = "lm") +
    theme_bw() + 
    xlab("Body Mass (g)") +
    ylab("Flipper Length (mm)") +
    ggtitle("Linear regression model between\nbody mass and flipper length in Penguins")
}


## Function to save the figure as a vector and define the size and scaling
save_scattergraph_svg <- function(penguins_mass_and_flippers, 
                                  filename, size, scaling){
  size_inches = size/2.54
  svglite(filename, width   = size_inches, 
          height  = size_inches, 
          scaling = scaling)
  scattergraph_penguins <- plot_penguin_figure(penguins_mass_and_flippers)
  print(scattergraph_penguins)
  dev.off()
}


## Function to save the figure as a png and define the size, resolution and scaling
save_scattergraph_png <- function(penguins_mass_and_flippers, 
                                  filename, size, res, scaling){
  agg_png(filename, width   =  size, 
          height  =  size, 
          units   =  "cm", 
          res     =  res, 
          scaling =  scaling)
  scattergraph_penguins <- plot_penguin_figure(penguins_mass_and_flippers)
  print(scattergraph_penguins)
  dev.off()
}
