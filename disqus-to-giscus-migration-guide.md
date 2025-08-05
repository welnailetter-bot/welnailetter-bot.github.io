# Disqus to Giscus Migration Guide for Jekyll

This guide provides step-by-step instructions for migrating from Disqus to Giscus comments system in the Jekflix Jekyll template.

## Current Disqus Implementation Analysis

### Files Currently Using Disqus:
- `_config.yml` - Contains `disqus_username: disqus_username` (line 26)
- `_includes/comments.html` - Main Disqus implementation with lazy loading
- `admin/config.yml` - Netlify CMS configuration for Disqus
- Documentation files mentioning Disqus setup

### Current Disqus Features:
- Lazy loading (loads when user scrolls near bottom)
- Conditional loading based on `site.disqus_username`
- Dynamic title and URL configuration
- Integration with Jekyll's translation system

## Giscus Overview

Giscus is a comments system powered by GitHub Discussions that offers:
- GitHub-native integration
- No external dependencies
- Support for reactions and threading
- Better privacy (no third-party tracking)
- Free to use
- Theme customization support

## Migration Steps

### Step 1: GitHub Repository Setup

1. **Create or use existing GitHub repository**
   - Can be the same repo as your Jekyll site or a separate one
   - Must be public
   - Enable Discussions in repository settings

2. **Configure Discussions**
   - Go to Settings → Features → Discussions (check the box)
   - Create a new discussion category for comments (e.g., "Comments", "Blog Comments")

3. **Install Giscus App**
   - Visit https://github.com/apps/giscus
   - Install the Giscus GitHub app
   - Grant permissions to your repository

### Step 2: Get Giscus Configuration

1. **Visit Giscus Configuration Generator**
   - Go to https://giscus.app
   - Enter your repository information
   - Select your preferred options
   - Copy the generated script tag

2. **Key Configuration Options:**
   - **Repository**: `username/repository-name`
   - **Page ↔️ Discussions Mapping**: `pathname` (recommended)
   - **Discussion Category**: Choose the category you created
   - **Theme**: `preferred_color_scheme` (adapts to user's system)

### Step 3: Update Jekyll Configuration

Update `_config.yml`:

```yaml
# Replace Disqus configuration
# disqus_username: disqus_username  # Comment out or remove

# Add Giscus configuration
giscus:
  repo: "your-username/your-repo-name"
  repo_id: "R_YOUR_REPO_ID"  # Get from giscus.app
  category: "Comments"
  category_id: "DIC_YOUR_CATEGORY_ID"  # Get from giscus.app
  mapping: "pathname"
  strict: "0"
  reactions_enabled: "1"
  input_position: "bottom"
  theme: "preferred_color_scheme"
  lang: "en"
  crossorigin: "anonymous"
```

### Step 4: Replace Comments Template

Replace the content of `_includes/comments.html`:

```html
{% if site.giscus.repo %}
<section class="comments">
    <h3>{{ site.translations.text.comments | default: "Comments" }}</h3>
    
    <div id="giscus-container">
        <div id="giscus-loader" style="text-align: center; padding: 20px;">
            <button onclick="loadGiscus()" style="padding: 10px 20px; background: #0366d6; color: white; border: none; border-radius: 5px; cursor: pointer;">
                Load Comments
            </button>
        </div>
    </div>
</section>

<script>
    var giscusLoaded = false;
    
    function loadGiscus() {
        if (giscusLoaded) return;
        
        giscusLoaded = true;
        
        // Create Giscus script
        var script = document.createElement('script');
        script.src = 'https://giscus.app/client.js';
        script.setAttribute('data-repo', '{{ site.giscus.repo }}');
        script.setAttribute('data-repo-id', '{{ site.giscus.repo_id }}');
        script.setAttribute('data-category', '{{ site.giscus.category }}');
        script.setAttribute('data-category-id', '{{ site.giscus.category_id }}');
        script.setAttribute('data-mapping', '{{ site.giscus.mapping | default: "pathname" }}');
        script.setAttribute('data-strict', '{{ site.giscus.strict | default: "0" }}');
        script.setAttribute('data-reactions-enabled', '{{ site.giscus.reactions_enabled | default: "1" }}');
        script.setAttribute('data-emit-metadata', '0');
        script.setAttribute('data-input-position', '{{ site.giscus.input_position | default: "bottom" }}');
        script.setAttribute('data-theme', '{{ site.giscus.theme | default: "preferred_color_scheme" }}');
        script.setAttribute('data-lang', '{{ site.giscus.lang | default: "en" }}');
        script.setAttribute('crossorigin', 'anonymous');
        script.async = true;
        
        // Replace the loader with the script
        var container = document.getElementById('giscus-container');
        container.innerHTML = '';
        container.appendChild(script);
    }
    
    // Auto-load on scroll (similar to original Disqus behavior)
    window.onscroll = function(e) {
        if ((window.innerHeight + window.scrollY) >= (document.body.offsetHeight - 800)) {
            if (!giscusLoaded) {
                loadGiscus();
            }
        }
    };
</script>

{% endif %}
```

### Step 5: Update Netlify CMS Configuration (Optional)

If using Netlify CMS, update `admin/config.yml`:

```yaml
# Replace Disqus field with Giscus fields
fields:
  - label: "Giscus Repository"
    name: "giscus_repo"
    widget: "string"
    hint: "GitHub repository for comments (username/repo-name)"
  - label: "Giscus Repository ID"
    name: "giscus_repo_id"
    widget: "string"
    hint: "Repository ID from giscus.app configuration"
  - label: "Giscus Category"
    name: "giscus_category"
    widget: "string"
    default: "Comments"
  - label: "Giscus Category ID"
    name: "giscus_category_id"
    widget: "string"
    hint: "Category ID from giscus.app configuration"
```

## Advanced Configuration

### Theme Switching Support

If your site supports theme switching, add this JavaScript to sync Giscus theme:

```javascript
function updateGiscusTheme(theme) {
    const iframe = document.querySelector('iframe.giscus-frame');
    if (iframe) {
        iframe.contentWindow.postMessage({
            giscus: {
                setConfig: {
                    theme: theme
                }
            }
        }, 'https://giscus.app');
    }
}

// Call this function when your site theme changes
// updateGiscusTheme('dark'); // or 'light'
```

### Alternative Simple Implementation

For a simpler implementation without lazy loading:

```html
{% if site.giscus.repo %}
<section class="comments">
    <h3>{{ site.translations.text.comments | default: "Comments" }}</h3>
    
    <script src="https://giscus.app/client.js"
            data-repo="{{ site.giscus.repo }}"
            data-repo-id="{{ site.giscus.repo_id }}"
            data-category="{{ site.giscus.category }}"
            data-category-id="{{ site.giscus.category_id }}"
            data-mapping="{{ site.giscus.mapping | default: 'pathname' }}"
            data-strict="{{ site.giscus.strict | default: '0' }}"
            data-reactions-enabled="{{ site.giscus.reactions_enabled | default: '1' }}"
            data-emit-metadata="0"
            data-input-position="{{ site.giscus.input_position | default: 'bottom' }}"
            data-theme="{{ site.giscus.theme | default: 'preferred_color_scheme' }}"
            data-lang="{{ site.giscus.lang | default: 'en' }}"
            crossorigin="anonymous"
            async>
    </script>
</section>
{% endif %}
```

## Migration Checklist

- [ ] Create/configure GitHub repository with Discussions enabled
- [ ] Install Giscus GitHub app
- [ ] Generate Giscus configuration at giscus.app
- [ ] Update `_config.yml` with Giscus settings
- [ ] Replace `_includes/comments.html` with Giscus implementation
- [ ] Update Netlify CMS configuration (if applicable)
- [ ] Test comments on a sample post
- [ ] Update documentation files to reference Giscus instead of Disqus

## Benefits of Migration

1. **Better Integration**: Native GitHub integration
2. **Privacy**: No third-party tracking
3. **Cost**: Completely free
4. **Control**: Full control over comment data
5. **Features**: Rich commenting with reactions, threading, and markdown support
6. **Performance**: Often faster loading than Disqus

## Troubleshooting

### Common Issues:
1. **Comments not showing**: Verify repository is public and Discussions are enabled
2. **Wrong category**: Ensure category exists and category ID is correct
3. **Theme not working**: Check theme name spelling in configuration
4. **Lazy loading not working**: Verify JavaScript syntax and container IDs

### Getting Repository and Category IDs:
1. Go to https://giscus.app
2. Enter your repository name
3. Select your category
4. The configuration tool will show the required IDs

## Additional Resources

- [Giscus Official Documentation](https://giscus.app)
- [GitHub Discussions Documentation](https://docs.github.com/en/discussions)
- [Jekyll Documentation](https://jekyllrb.com/docs/)

---

*This guide was created for migrating the Jekflix template from Disqus to Giscus. Adjust paths and configuration names according to your specific Jekyll theme.*