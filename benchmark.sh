#! /bin/bash

hyperfine --shell zsh --warmup 5 --runs 10 \
--setup "rm package-lock.json && rm pnpm-lock.yaml && rm yarn.lock && rm deno.lock && bun.lockb && rm -rfv node_modules || true" \
--cleanup "rm package-lock.json && rm pnpm-lock.yaml && rm yarn.lock && rm deno.lock && bun.lockb && rm -rfv node_modules || true" \
"npm i" \
"yarn" \
"pnpm install" \
"deno install" \
"bun install" \
--prepare "rm -rfv node_modules" \
--export-markdown ./benchmark.md && \
rm package-lock.json && rm pnpm-lock.yaml && rm yarn.lock && rm deno.lock && bun.lockb && rm -rfv node_modules