# Region Abbreviations Module

Exposes a canonical map of Azure region names to short abbreviations.

## Example

```hcl
module "region_abbreviations" {
  source = "../region-abbreviations"
}
```

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_regions"></a> [regions](#output\_regions) | Map of Azure location names (both canonical and display formats) to abbreviations. |