# syntax=docker/dockerfile:1
# This Dockerfile sets up a Jekyll environment tailored
# for the Agency Template and assumes you have cloned #
# the repo https://github.com/raviriley/agency-jekyll-theme-starter
# Run the following in that directory:
# docker build -t j-image .

FROM debian
WORKDIR /j-dir
RUN apt-get update
RUN apt-get install ruby-full build-essential -y
RUN export GEM_HOME="$HOME/gems"
RUN export PATH="$HOME/gems/bin:$PATH"
RUN gem install jekyll bundler

# Install Gems specific for the Agency Template
COPY Gemfile Gemfile.lock ./
RUN bundle install
