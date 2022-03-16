# SingerSongwriter

As huge fans of Shawn Mendes and data, we decided to combine the two passions together to further understand Shawn's music. We started with the Shawn Mendes album, released back in 2018, where several of his songs made it to billboard's top 100 and remained on the top 100 for awhile. We wanted to understand what kinds of emotions Shawn wrote used the most in the album and use it to help us understand why his songs were so popular.

# Phase 1 Gathering Data & Exploration

Utilizing Spotify's API with Python, we were able to extract song attributions such as, the key song was written in, duration, genre, and song lyrics. Every data project starts with exploration so we began by looking into most common words Shawn used in his music. We illustrated this using word cloud library in Pyhon. We found it fitting to turn the cloud into the shape of a guitar! Next, we did a simple sentimental analysis for each song by calculating the polarity and subjectivity scores and plotting the numbers on a graph. The results were surprising as we discovered that Shawn's music tends to be relatively objective-neutral despite most of his songs are about romance. Not surprisingly most of his songs had a more positive score than negative score in terms of polarity.

# Phase 2 First Classifier
Word clouds are fun and sentimental analysis is great for exploring the data, but it doesn't answer the deeper questions. We were not able to see what kinds of emotions Shawn typically wrote about. Sentimental analysis only tells us negative or positive, opinionated or objective. It fails to tells us if he likes to write about joy, sad, anger, etc. We began looking into methods of how NLP models processed and predicted emotions. We created our first Recurrent Neural Network (RNN), to process and clasify emotions. We defined our model to use what Paul Ekman identified as the basic universal emotions: anger, surprise, disgust, joy, fear and sadness. We played around with how much of the corpus to pass in, a sentece vs a block of text.

# Phase 3 - Improving the Classifier - Currently in progress! 
Although the RNN model was able to classify the songs, it had its flaws. The classifier used the bag of words method that did not take into consideration the context of the words. We noticed that the model would incorrectly classify a sentence because it containted a positive word, but how the word was used in the sentence was not necessarily a 'joyful' emotion. Our next goal was to find other methods that was able to take into consideratino the context of how the word was used instead of only evaluating the word itself. We began looking into other ways on how we could preprocess the text in a way where the model would be able to take into consideration certain words that triggered or changed the meaning of the text. 

Currently working to encode each sentence in a block of text, broken out into two separate embedding methods. 
1) emotional feature representation, embedding the six emotions we mentioned about earlier utilizing word2vec 
2) general sentence level representation utilizing Bidirectional Encoder Representations from Transformers (BERT).

The goal is to then combine is to combine these two matrices to use as input for the context level encoder. 


