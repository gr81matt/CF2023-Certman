# CF2023-CertMan

An update to the extension for modern ColdFusion Administrators (2016+) that allows adding/viewing/removing of SSL certificates in the Java certificate store from within the Administrator.

This works with ColdFusion 2016 and newer. For older versions please check out [CF-Certman](https://github.com/coldfumonkeh/CF-Certman).

## Changes

Updated to work with the new CF Administrator design. Applied new styles to existing tables/buttons. URL Encoding/Decoding for certificate names with brackets/special characters.

## Installation

Extract the contents of this repository into a CFIDE/administrator/certman/ directory.

Edit the CFIDE\administrator\custommenu.xml file to add the following submenu xml key:-

    <submenu label="SSL Certificates">
      <menuitem href="certman" target="content">Certificate Management</menuitem>
    </submenu>

Included a section icon -- having trouble finding instructions on how to set that. Icon needs specific name and must be moved to the CFIDE\administrator\images\ folder.

### Notes

The CertMan project was originally developed by Paul Connell and Updated for CF10 by Matt Gifford.

This is a fresh fork taken to separate the specific ColdFusion versions for easier use.
