FROM ubuntu

RUN apt-get update
RUN apt-get install -y ruby-full build-essential zlib1g-dev

WORKDIR /root

RUN echo '# Install Ruby Gems to ~/gems' >> .bashrc
RUN echo 'export GEM_HOME="$HOME/gems"' >> .bashrc
RUN echo 'export PATH="$HOME/gems/bin:$PATH"' >> .bashrc

RUN gem install jekyll bundler

RUN apt-get install -y vim