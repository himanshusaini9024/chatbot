FROM chatwoot/chatwoot:v3.12.0

RUN apk add --no-cache nodejs npm
RUN npm install -g pnpm

WORKDIR /app

COPY . .

RUN echo "onlyBuiltDependencies:" >> pnpm-workspace.yaml && \
    echo "  - '@chatwoot/prosemirror-schema'" >> pnpm-workspace.yaml

RUN pnpm install --ignore-scripts=false

RUN bundle exec rails assets:precompile