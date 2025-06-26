# Pharo MCP Server

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Certified by MCP Review](https://img.shields.io/badge/MCP_Review-Certified-blue)](https://mcpreview.com/mcp-servers/paulwilke/pharo-mcp-server)

<!-- Add other badges later, e.g., build status, version -->

**Pharo Smalltalk implementation of Anthropic's Model Context Protocol (MCP) server specification. Enables LLMs like Claude to interact with Pharo applications.**

---

## Table of Contents

*   [What is MCP?](#what-is-mcp)
*   [Goal of this Project](#goal-of-this-project)
*   [Features](#features)
*   [Installation](#installation)
*   [Basic Usage](#basic-usage)
*   [Defining Tools](#defining-tools)
*   [Configuration](#configuration)
*   [Development & Contributing](#development--contributing)
*   [License](#license)

## What is MCP?

The Model Context Protocol (MCP), developed by Anthropic, is a specification designed to standardize how Large Language Models (LLMs) interact with external tools and services. It defines mechanisms for:

1.  **Discovery:** How an LLM finds out if a service supports MCP and gets basic information.
2.  **Service Description:** How a service describes its available tools (functions), including their names, purposes, input parameters, and output formats.
3.  **Invocation:** How an LLM securely calls a specific tool with the required arguments and receives the result.

The goal is to make LLM tool usage more reliable, secure, and standardized.

For more details, see the official [Model Context Protocol GitHub organization](https://github.com/modelcontextprotocol).

## Goal of this Project

This project aims to provide a robust and easy-to-use **server-side implementation of the MCP specification** specifically for the **Pharo Smalltalk** environment.

It allows developers to expose functionalities within their Pharo applications (like querying data, creating objects, triggering actions) as "tools" that MCP-compliant LLMs (such as Claude 3) can discover and invoke through the standardized protocol.

This bridges the gap between the dynamic Pharo environment and the capabilities of modern LLMs.

## Features

*   **MCP Specification Compliance:** Implements the core server-side endpoints:
    *   Discovery (`/.well-known/model-context`)
    *   Service Description (`/mcp/description` - or configurable path)
    *   Invocation (`/mcp/invoke` - or configurable path)
*   **Dynamic Tool Registration:** Provides a simple API to register Pharo methods or blocks as MCP tools.
*   **Automatic Service Description:** Generates the MCP Service Description JSON based on the registered tools and their metadata (name, description, schemas).
*   **Web Server Integration:** Built upon the [Teapot](https://github.com/pharo-web/teapot) micro web framework.
*   **JSON Handling:** Uses [NeoJSON](https://github.com/svenvc/NeoJSON) for robust JSON parsing and generation.
*   **Extensible:** Designed to be integrated into larger Pharo applications.
*   **(Planned):** Input validation using JSON Schema definitions for tool parameters.
*   **(Planned):** Integration helpers for common Pharo object models (e.g., using [Voyage](https://github.com/pharo-nosql/voyage)).

## Installation

This project is intended to be loaded using Metacello.

1.  **Ensure Metacello is loaded** in your Pharo image (it usually is).
2.  **Execute the following code** in a Pharo Workspace (adjust the repository URL and branch/tag if necessary):

```smalltalk
Metacello new
    baseline: 'MCPFramework'; "<- Use the actual name of YOUR baseline class (without 'BaselineOf')"
    repository: 'github://YOUR_USERNAME/pharo-mcp-server:main/'; "<- CHANGE THIS to your repo URL and branch/tag"
    load.
