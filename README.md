# Pharo MCP Server – discontinued

> [!WARNING]
> **This project has been abandoned and will not be developed further.**

This repository was only ever a placeholder. No working code was published here – the plan for a Pharo implementation of Anthropic's [Model Context Protocol (MCP)](https://github.com/modelcontextprotocol) never got past an initial stub.

## Why

In the meantime, an MCP server implementation for Pharo already exists, so there is no point in building a second one here.

## What's next

Instead of an MCP server, I'm now taking a different approach: a **command-line interface (CLI)** for live development and debugging in a running Pharo image (`stlive`). A shell is the one integration point every coding agent already has, and the protocol behind the CLI stays transport-agnostic, so an MCP adapter could still be added on top later if needed.

A link to the new project will be added here once it is public.

## License

[MIT](LICENSE)
