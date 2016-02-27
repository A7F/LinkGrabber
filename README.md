# LinkGrabber
A bot who captures group links posted by other users and joins them. Then forward grabbed links to a specified target channel.
I tried to lighten as much as possible telegram-bot in order to fasten it.

Grabber based on supergroup branch of yagop telegram-bot.

###Installation
it's pretty easy, just run this command on your shell:
```
sudo apt-get install libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev libevent-dev make unzip git redis-server g++ libjansson-dev libpython-dev expat libexpat1-dev
```
then install using:
```
cd $home
git clone https://github.com/A7F/LinkGrabber.git
cd grabber-bot
./launch.sh install
```
insert your phone number, write the code telegram will send and that's it.

###Setting up your target channel
You need the channel id you made for the grabber.
Then open /plugins/grabber.lua and edit line 35
```
local channel = "channel#id"..<INSERT HERE YOUR ID WITHOUT ANY BRACKETS>
```
