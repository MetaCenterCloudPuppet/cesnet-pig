## Apache Pig Puppet Module

[![Build Status](https://travis-ci.org/MetaCenterCloudPuppet/cesnet-pig.svg?branch=master)](https://travis-ci.org/MetaCenterCloudPuppet/cesnet-pig)

####Table of Contents

1. [Module Description - What the module does and why it is useful](#module-description)
2. [Setup - The basics of getting started with pig](#setup)
    * [What cesnet-pig module affects](#what-pig-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with pig](#beginning-with-pig)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
    * [Classes](#classes)
    * [Module Parameters (pig class)](#parameters)
5. [Development - Guide for contributing to the module](#development)

<a name="module-description"></a>
##Module Description

This module installs Apache Pig - platform for analyzing large data sets. By default **pig** expects locally set-up Hadoop client.

Supported are:

* **Fedora 21**: native packages (tested on Pig 0.13.0)
* **Debian 7/wheezy**: Cloudera distribution (tested on CDH 5.3.0, Pig 0.12.0)
* **Ubuntu 14/trusty**: Cloudera distribution (tested on CDH 5.3.0, Pig 0.12.0)
* **RHEL 6 and clones**: Cloudera distribution (tested on CDH 5.4.2, Pig 0.12.0)

<a name="setup"></a>
##Setup

<a name="what-pig-affects"></a>
###What cesnet-pig module affects

* Packages: installs pig packages
* Files: files with environment settings

<a name="setup-requirements"></a>
###Setup Requirements

Be aware of:

* **Hadoop repositories**
 * neither Cloudera nor Hortonworks repositories are configured in this module (for Cloudera you can find list and key files here: [http://archive.cloudera.com/cdh5/debian/wheezy/amd64/cdh/](http://archive.cloudera.com/cdh5/debian/wheezy/amd64/cdh/), Fedora has Hadoop as part of distribution, ...)

<a name="beginning-with-pig"></a>
###Beginning with pig

**Example**:

    include pig

<a name="usage"></a>
##Usage

By default pig uses Hadoop for its operations, like launched with *-x mapreduce*:

    pig -x mapreduce

Pig can be launched locally this way:

    pig -x local

Usage Pig with HBase: add following to the pig scripts (replace *&lt;ZooKeeper_version&gt;* and *&lt;HBase_version&gt;* by current values):

    register /usr/lib/zookeeper/zookeeper-<ZooKeeper_version>.jar
    register /usr/lib/hbase/hbase-<HBase_version>-security.jar

Usage Pig with DataFu: add following to the pig scripts (replace *&lt;DataFu_version&gt;* by current value):

    REGISTER /usr/lib/pig/datafu-<DataFu_version>.jar

<a name="reference"></a>
##Reference

<a name="classes"></a>
###Classes

* [**`pig`**](#class-pig): Pig setup
* `pig::config`
* `pig::install`
* `pig::params`

<a name="parameters"></a>
<a name="class-pig"></a>
###Module Parameters (pig class)

####`datafu_enabled`

Install also Pig User-Defined Functions collection. Default: true.

<a name="development"></a>
##Development

* Repository: [https://github.com/MetaCenterCloudPuppet/cesnet-pig](https://github.com/MetaCenterCloudPuppet/cesnet-pig)
* Tests:
 * basic: see *.travis.yml*
 * vagrant: [https://github.com/MetaCenterCloudPuppet/hadoop-tests](https://github.com/MetaCenterCloudPuppet/hadoop-tests)
* Email: František Dvořák &lt;valtri@civ.zcu.cz&gt;
