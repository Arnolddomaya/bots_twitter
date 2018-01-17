require 'pry'
require 'twitter'



p "consumer_key stp ?"
twitter_consumer_key = gets.chomp
p "consumer_secret stp ?"
twitter_consumer_secret = gets.chomp
p "consumer_token stp ?"
twitter_consumer_token = gets.chomp
p "consumer_token_secret stp ?"
twitter_consumer_token_secret = gets.chomp

@client = Twitter::REST::Client.new do |config|
  config.consumer_key        = twitter_consumer_key
  config.consumer_secret     = twitter_consumer_secret
  config.access_token        = twitter_consumer_token
  config.access_token_secret = twitter_consumer_token_secret
end
#p client




liste_journaliste = ["@jcunniet","@PaulLampon","@Aziliz31","@ssoumier","@marionsouzeau","@gaellombart","@bendarag","@AurelieLebelle","@julienduffe","@thomaspoupeau","@LilyRossignol","@ClairGuedon","@stephanieauguy","@claw_prolongeau","@_JulieMenard","@LColcomb","@Zlauwereys","@MeLonguet","@DorotheeLN",
  "@NolwennCosson","@ADaboval","@Remibaldy","@bderveaux","@amandechap"]
friends_pseudo = ["@simwyck", "@THPStudent","@BuffordBiff"]
texte = "Et Un autre tweet, trop cool ! "

#binding.pry
#la fonction qui permet de faire un tweet avec une liste de pseudo Twitter
#j'ai juste pris la liste des nom de mes camarades :@friends_pseudo au lieu de la liste des journaliste
def tweet_journaliste(liste, texte)
  liste.each do |pseudo|
    puts pseudo
    @client.update(texte+" "+pseudo)
  end
end


#retweet les deux derniers tweets des utilisateurs dans l'array "liste"
#entrée en paramètre

def retweeter(liste)

  liste.each do |user_id|
    tweets = @client.user_timeline(user_id, count: 2)
    tweets.each { |tweet| @client.retweet tweet}
  end
end


#choisir la fonction à exécuter
tweet_journaliste(friends_pseudo,texte)
#retweeter(friends_pseudo)
