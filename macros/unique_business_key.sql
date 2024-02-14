{%- macro unique_business_key(business_key_fields) -%}
    md5_number_lower64(concat({%- for field in business_key_fields -%}
        '', coalesce(cast({{ field }} as STRING), '')
        {%- if not loop.last -%}, '|', {% endif %}
    {% endfor %}))
{% endmacro %}
