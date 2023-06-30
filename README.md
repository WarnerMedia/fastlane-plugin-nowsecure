# NowSecure `Fastlane` Plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-nowsecure)
[![test](https://github.com/warnermedia/fastlane-plugin-nowsecure/actions/workflows/test.yml/badge.svg)](https://github.com/warnermedia/fastlane-plugin-nowsecure/actions/workflows/test.yml)

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-nowsecure`, add it to your project by running:

```bash
fastlane add_plugin nowsecure
```

## About nowsecure

Fastlane plugin for [NowSecure](https://www.nowsecure.com/) platform automation.

All actions require NowSecure account with associated API token and Group ID.

### Available actions

#### Action: `upload_to_nowsecure`

##### Description: Uploads a mobile binary to NowSecure

##### Parameters:

Key  | Environment Variable Equivalent | Description | Required?
------------- | ------------- | ------------- | -------------
`nowsecure_token`  | `NOWSECURE_TOKEN` | The API token for your NowSecure account | YES
`nowsecure_group_id`  | `NOWSECURE_GROUP_ID` | The Group ID for your NowSecure account | YES
`nowsecure_app_path`  | `NOWSECURE_APP_PATH` | File path of app to upload to NowSecure` | YES

## Example

Check out the [example `Fastfile`](fastlane/Fastfile) to see how to use this plugin. Try it by cloning the repo, running `fastlane install_plugins` and `bundle exec fastlane test`.

## Run tests for this plugin

To run both the tests, and code style validation, run

```
bundle exec rake
```

To automatically fix many of the styling issues, use
```
bundle exec rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).

## License

This repository is released under [the MIT license](https://en.wikipedia.org/wiki/MIT_License).  View the [local license file](./LICENSE).

## Test CLA Change

Small change to test the CLA.
