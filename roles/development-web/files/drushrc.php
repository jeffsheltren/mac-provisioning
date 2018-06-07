<?php

// Set the development environment.
$_SERVER['APPLICATION_ENV'] = 'development';

// Ignore the data in these tables, but keep the table structures. 
// Make sure to update the list when new cache tables are added.
$options['structure-tables']['common'] = array(
  'apachesolr_attachments_files',
  'cache',
  'cache_admin_menu',
  'cache_apachesolr',
  'cache_block',
  'cache_bootstrap',
  'cache_commerce_shipping_rates',
  'cache_field',
  'cache_filter',
  'cache_form',
  'cache_image',
  'cache_libraries',
  'cache_media_xml',
  'cache_menu',
  'cache_page',
  'cache_path',
  'cache_rules',
  'cache_token',
  'cache_update',
  'cache_views',
  'cache_views_data',
  'history',
  'search_dataset',
  'search_index',
  'search_node_links',
  'search_total',
  'sessions',
  'watchdog',
);
 
// Use the list of cache tables above.
$options['structure-tables-key'] = 'common';
