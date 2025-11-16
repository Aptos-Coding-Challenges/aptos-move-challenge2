# Challenge #2: FA (Fungible Asset) Public Launch Platform 🚀

Build out the missing logic inside `contract::fa_launchpad` (see `sources/fa_launchpad.move`)

to create, mint, and burn Fungible Assets using Aptos Token Objects. All behaviors are enforced by

`tests/fa_launchpad_test.move`, and helper scripts verify that those tests have not been

altered while you work on the module.

## Repository Layout

- `Move.toml` – package metadata plus pinned `aptos-framework` dependencies.

- `sources/fa_launchpad.move` – starter contract with complete type definitions, challenge

  context comments, and `abort 0` function bodies for you to replace.

- `tests/fa_launchpad_test.move` – canonical test suite; **do not modify this file**.

- `verify.sh` / `verify.ps1` – automation that checks the test hash and then runs

  `aptos move test`.

## Checkpoint 1: 📦 Environment Setup

Before you begin, install the following tools:

1. [Install Aptos CLI](https://aptos.dev/build/cli)

Then fork and clone the challenge repo to your computer and install dependencies:

1. [Fork this repository.](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/fork-a-repo)

2. Clone the repository

```bash

cd [DIRECTORY_OF_YOUR_CHOICE]

git clone [FORKED_REPO_URL]

```

3. Open the cloned repo in [Cursor IDE](https://cursor.com/) or [VSCode IDE](https://code.visualstudio.com/)

4. Install the `Move on Aptos` extension

![alt text](</public/move-on-aptos.png>)

## Checkpoint 2: 🎲 Solve the Challenge!

Go to the `sources/fa_launchpad.move` file to solve the challenge.

### What You Must Implement

Inside `sources/fa_launchpad.move`:

1. `create` must create a new Fungible Asset with the provided metadata (name, symbol, decimals, icon_uri, project_uri), store the `TokenRefsStore` containing mint_ref, burn_ref, and other references, and transfer the created FA object to the caller who becomes the owner.

2. `mint` must restrict execution to the FA's creator (owner), verify ownership, and use the mint_ref to mint the specified amount of tokens.

3. `burn` must allow anyone to burn their own FA tokens using the burn_ref stored in the `TokenRefsStore`.

Initialization (`init_module`) and helper getters are provided; focus on wiring the create, mint,

and burn flows so that the unit tests pass.

**📚 Here are some helpful resources if you are struggling!**

- [Your First Fungible Asset Guide](https://aptos.dev/build/guides/first-fungible-asset)

- [Aptos Move Documentation](https://aptos.dev/build/smart-contracts)

- [Fungible Asset Documentation](https://aptos.dev/build/smart-contracts/fungible-assets)

## Checkpoint 3: ✅ Validate Your Work!

### Test Integrity Guard

The scripts compare the SHA-256 hash of `tests/fa_launchpad_test.move` against the

expected value (`ab2e0a5f90e78f275126146dca0edcda83526cd7a7f43fbf0f72eaca0cb94bcd`).

If the hash differs, validation stops immediately. This guarantees that every solution

is judged against the same tests.

### How to Validate Your Work

Linux/macOS:

```bash

./verify.sh

```

Windows (PowerShell 7+):

```powershell

pwsh -File verify.ps1

```

Both scripts:

1. Ensure the test file hash matches the expected value.

2. Run `aptos move test` (plus any extra arguments you pass through).

You can still run `aptos move test` manually, but the scripts are the easiest way to

prove your solution meets the challenge requirements.

### Tips

- The constants at the top of `sources/fa_launchpad.move` can be tweaked to personalize

  metadata, but avoid changing the public API.

- Read through the tests to understand the order of operations the graders expect.

- The Aptos CLI must be available on your PATH for both the scripts and manual runs.

## Checkpoint 4: 💯 Submit Your Answer 

1. After successfully passing the tests, push your code to your forked GitHub repo and [make a PR to the original repo.](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request-from-a-fork) 

2. Inside the PR include:
  - Screenshot of your terminal showing the result of running the test script.

