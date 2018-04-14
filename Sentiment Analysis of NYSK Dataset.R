require(stringr)
WordList <- str_split(readLines("D:/nysk.csv"), pattern = " ")
text<-paste(unlist(WordList), collapse=' ')
str(text)
library(dplyr)
text_df <- data_frame(line = 1, text = text)
text_df

library(tidytext)
text_df2 <- text_df %>%>
  unnest_tokens(word,text)
data(stop_words)
text_df2 <- text_df2 %>%
  anti_join(stop_words)
tibble<-text_df2 %>%
  count(word,sort=TRUE)

tibblefiltered = tibble %>% filter (n > 1)
library(wordcloud)
text_df2 %>%
  anti_join(stop_words) %>%
  count(word) %>%
  with (wordcloud(word, n, max.words = 100))

library(tidytext)
library(reshape2)
text_df2 %>% 
  filter()
text_df2 %>%>
  inner_join(get_sentiments("bing")) %>%
  count(word, sentiment, sort=TRUE) %>%
  acast(word ~ sentiment, value.var = "n", fill = 0) %>%
  comparison.cloud(colors = c("gray20", "gray80"),
                   max.words=100)
