# Photon by Komoot

This contains the dockerized automatized version of [Photon](https://photon.komoot.io) by [Komoot](https://komoot.de) used to power the search option in MapDiscover.

## Download search index

Before using Photon we need to download the search index for the country of our choice. In the case of MapDiscover this is Germany (short code: *de*):

```bash
$ export country=de
$ bash ./downloadIndex.sh
```

~~If you want to download the search engine for more countries then execute the script again with a new short code `country` . The script downloads an archive and calls an decompress program which also handles the merging~~ (Untested)

## Starting

For the first time:

```bash
$ docker-compose up photon
```

And then as usual

```bash
$ docker-compose start photon
$ docker-compose stop photon
$ docker-compose restart photon # We love this one :)
```

