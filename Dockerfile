FROM ruby:3.0.0

# Create app directory
WORKDIR /app

# Install app code
COPY . .

# Install npm/Yarn
RUN apt-get update -qq && apt-get install -y nodejs npm
RUN npm install -g yarn
# Install dependencies0
RUN bundle config set --local deployment 'true' && bundle install && yarn install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 9000

# Configure the main process to run when running the image
ENV RAILS_ENV=production
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "9000"]
