library(tidyverse)
library(gganimate)
load(here::here("data/dragons.RData"))
dragons <- filter(dragons, mountainRange %in% c("Baravia", "Ligurian", "Emmental"))

mountain <- dragons %>% 
    transmute(label = mountainRange) %>% 
    unique() %>% 
    mutate(y = 2,
           x = seq(from = 2, by = 3, length.out = nrow(.)))

site <-  dragons %>% 
    select(mountainRange, site) %>% 
    unique() %>% 
    mutate(x = row_number(),
           y = 1)
  
wide <- rename(site, x2 = x, y2 = y) %>% 
  left_join(rename(mountain, 
                   mountainRange = label,
                   x1 = x, y1 = y)) %>% 
  bind_rows(transmute(mountain, 
                   mountainRange = label,
                   x1 = x, y1 = y,
                   x2 = mean(site$x), y2 = 3)) %>% 
  mutate(label = NA, 
         panel = 1) %>% 
  bind_rows(tibble(label = NA, panel = 2))

anim <- site %>% 
  transmute(label = site, x, y) %>%
  rbind(mountain) %>%   
  rbind(summarise(mountain, y = 3, x = mean(x)) %>%
          mutate(label = "Dragon population")) %>% 
  mutate(panel = 1) %>% 
  bind_rows(dragons %>% 
              select(mountainRange, site) %>% 
              unique() %>% 
              mutate(population = "Dragon\npopulation") %>% 
              mutate(y = row_number()) %>% 
              gather(key, label, -y) %>% 
              mutate(x = case_when(key == "mountainRange" ~ 2,
                                   key == "population" ~ 1,
                                   key == "site" ~ 3),
                     panel = 2) ) %>% 
  
  ggplot(aes(x = x, y = y, label = label)) +
  geom_segment(data = wide, 
               aes(x = x1, y = y1, xend = x2, yend = y2)) +
  geom_label(size = 2) +
  scale_y_continuous(limits = c(0, nrow(site)+1)) +
  scale_x_continuous(limits = c(-1, nrow(site)+1)) +
  # facet_wrap(~panel, scales="free") +
  theme_void() +
  transition_states(panel) +
  exit_disappear(early = TRUE)

anim

anim_save(anim, file = here::here("docs/static/hierarchy.gif"))
