# ==============================================================================
# Step 1: Environment settings, timing layer, and directory creation.
# ==============================================================================

#!/usr/bin/env bash
# ==============================================================================
# Script Name: Universal Joomla Scanner (DevSecOps Dynamic Dashboard Edition)
# Author:      MAHDI AHAZAN
# GitHub:      https://github.com/MahdiAhazan/Joomla-Scanner
# ==============================================================================

START_TIME=$(date +%s)
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Output definitions
REPORT_DIR="/tmp/joomla_reports_$TIMESTAMP"
HTML_FILE="/root/joomla_scan_report_$TIMESTAMP.html"
JSON_FILE="/root/joomla_scan_report_$TIMESTAMP.json"
FILTER_FILE="/root/joomla_core_extensions.txt"
COMMERCIAL_DB_FILE="/root/joomla_commercial_db.txt"

mkdir -p "$REPORT_DIR"

# ==============================================================================
# Step 2: Printing the custom banner and the terminal's initial graphic menu.
# ==============================================================================
# --- ASCII Art Banner ---

clear
echo -e "\e[36m"
echo "███╗   ███╗ █████╗ ██╗  ██╗██████╗ ██╗     █████╗ ██╗  ██╗ █████╗ ███████╗ █████╗ ███╗   ██╗"
echo "████╗ ████║██╔══██╗██║  ██║██╔══██╗██║    ██╔══██╗██║  ██║██╔══██╗╚══███╔╝██╔══██╗████╗  ██║"
echo "██╔████╔██║███████║███████║██║  ██║██║    ███████║███████║███████║  ███╔╝ ███████║██╔██╗ ██║"
echo "██║╚██╔╝██║██╔══██║██╔══██║██║  ██║██║    ██╔══██║██╔══██║██╔══██║ ███╔╝  ██╔══██║██║╚██╗██║"
echo "██║ ╚═╝ ██║██║  ██║██║  ██║██████╔╝██║    ██║  ██║██║  ██║██║  ██║███████╗██║  ██║██║ ╚████║"
echo "╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚═╝    ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝"
echo -e "\e[0m"
echo -e "\e[32m[+]\e[0m Developed by: \e[1mMAHDI AHAZAN\e[0m"
echo -e "\e[32m[+]\e[0m Project URL:  \e[34mhttps://github.com/MahdiAhazan/Joomla-Scanner\e[0m"
echo "=============================================================================="
echo -e "\e[33m[*]\e[0m Initializing Universal Server Scan & Database Setup..."

# ==============================================================================
# Step 3: Automatically generate the filter text file for default Joomla core extensions.
# ==============================================================================
# --- Step 3: Auto-Create Core Filter Database File ---

if [ ! -f "$FILTER_FILE" ]; then
    cat << 'EOF' > "$FILTER_FILE"
com_admin
com_ajax
com_associations
com_banners
com_cache
com_categories
com_checkin
com_config
com_contact
com_content
com_contenthistory
com_cpanel
com_fields
com_finder
com_installer
com_joomlaupdate
com_languages
com_login
com_mailto
com_menus
com_messages
com_modules
com_newsfeeds
com_plugins
com_postinstall
com_privacy
com_redirect
com_search
com_tags
com_templates
com_users
com_wrapper
com_actionlogs
com_media
com_workflow
com_guidedtours
com_scheduler
com_mails
plg_authentication_joomla
plg_authentication_ldap
plg_authentication_cookie
plg_captcha_recaptcha
plg_captcha_invisible_recaptcha
plg_content_joomla
plg_content_loadmodule
plg_content_pagebreak
plg_content_pagenavigation
plg_content_vote
plg_content_fields
plg_content_finder
plg_content_confirmconsent
plg_editors_tinymce
plg_editors_codemirror
plg_editors_none
plg_system_log
plg_system_logout
plg_system_redirect
plg_system_remember
plg_system_sef
plg_system_stats
plg_system_updatenotifier
plg_system_fields
plg_system_privacyconsent
plg_system_webauthn
plg_system_debug
plg_system_sessiongc
plg_system_skipto
plg_actionlog_joomla
plg_finder_categories
plg_finder_contacts
plg_finder_content
plg_finder_newsfeeds
plg_finder_tags
mod_articles_archive
mod_articles_latest
mod_articles_popular
mod_banners
mod_breadcrumbs
mod_custom
mod_feed
mod_footer
mod_languages
mod_login
mod_menu
mod_random_image
mod_stats
mod_syndicate
mod_tags_popular
mod_tags_similar
mod_whosonline
mod_wrapper
mod_popular
mod_sampledata
mod_version
protostar
beez3
isis
hathor
cassiopeia
atum
EOF
fi

# ==============================================================================
# Step 4: Automatically generate the text file database of commercial plugins and packages.
# ==============================================================================
# --- Step 4: Auto-Create Commercial Database File (Joomla 6 Ready) ---

if [ ! -f "$COMMERCIAL_DB_FILE" ]; then
    cat << 'EOF' > "$COMMERCIAL_DB_FILE"
# Joomla Commercial & Complex Packages Baseline Reference Database (2026)
# Format syntax rules: element_slug | joomla_major_version | latest_stable_version
# -----------------------------------------------------------------------------

# Fabrik Application Framework Suite
fabrik|3|3.10
fabrik|4|4.3
fabrik|5|4.3
fabrik|6|4.3

# DJ-Classifieds Core & Extensions Ecosystem
djclassifieds|3|3.9.4
djclassifieds|4|4.1.3
djclassifieds|5|4.1.3
djclassifieds|6|4.1.3

# LiteSpeed Cache Ecosystem
purge|3|1.5.2
purge|4|1.5.2
purge|5|1.5.2
purge|6|1.5.2
lscache|3|1.4.3
lscache|4|1.4.3
lscache|5|1.4.3
lscache|6|1.4.3
liteweb|3|1.4.3
liteweb|4|1.4.3
liteweb|5|1.4.3
liteweb|6|1.4.3
litespeed|3|1.4.3
litespeed|4|1.4.3
litespeed|5|1.4.3
litespeed|6|1.4.3

# YOOtheme Pro Ecosystem
yootheme|3|4.2.12
yootheme|4|5.0.37
yootheme|5|5.0.37
yootheme|6|5.0.37
location|3|4.2.12
location|4|5.0.37
location|5|5.0.37
location|6|5.0.37
mediafile|3|4.2.12
mediafile|4|5.0.37
mediafile|5|5.0.37
mediafile|6|5.0.37

# JCH Optimize Suite
jchoptimize|3|5.4.0
jchoptimize|4|8.2.1
jchoptimize|5|8.2.1
jchoptimize|6|8.2.1

# Smart Slider 3 Generation
smartslider|3|3.5.1
smartslider|4|3.5.18
smartslider|5|3.5.18
smartslider|6|3.5.18
nextend|3|3.5.1
nextend|4|3.5.18
nextend|5|3.5.18
nextend|6|3.5.18

# AcyMailing Newsletter Suite
acymailing|3|5.11.4
acymailing|4|5.11.4
acym|3|7.5.0
acym|4|10.10.5
acym|5|10.10.5
acym|6|10.10.5

# Weeblr Advanced Optimization
forsef|3|4.4.2
forsef|4|4.4.2
forsef|5|4.4.2
forsef|6|4.4.2
forseo|3|3.3.1
forseo|4|3.3.1
forseo|5|3.3.1
forseo|6|3.3.1

# Mighty Extensions & PWT
mightysites|3|3.2.5
mightysites|4|3.2.5
mightysites|5|3.2.5
mightysites|6|3.2.5
pwtseo|3|2.3.0
pwtseo|4|2.3.0
pwtseo|5|2.3.0
pwtseo|6|2.3.0

# Phoca & iJoomla Guru
phocadownload|3|3.2.3
phocadownload|4|4.0.10
phocadownload|5|4.0.10
phocadownload|6|4.0.10
sigpro|3|3.11.2
sigpro|4|3.11.2
sigpro|5|3.11.2
sigpro|6|3.11.2
guru|3|6.1.4
guru|4|6.1.4
guru|5|6.1.4
guru|6|6.1.4
EOF
fi

# Initialize JSON schema structure
echo "{" > "$JSON_FILE"
echo "  \"scan_meta\": {" >> "$JSON_FILE"
echo "    \"scan_date\": \"$(date)\"," >> "$JSON_FILE"
echo "    \"author\": \"MAHDI AHAZAN\"," >> "$JSON_FILE"
echo "    \"project_url\": \"https://github.com/MahdiAhazan/Joomla-Scanner\"" >> "$JSON_FILE"
echo "  }," >> "$JSON_FILE"
echo "  \"websites\": [" >> "$JSON_FILE"

FIRST_SITE=true

# ==============================================================================
# Step 5: Main loop to trigger server scanning and extract the Joomla core version.
# ==============================================================================
# --- Step 5: Server Crawler Loop & Core Finder ---

find / -maxdepth 7 -type f \( -name "version.php" -o -name "Version.php" \) 2>/dev/null | while read -r file; do
    if [[ "$file" == *"/components/"* || "$file" == *"/administrator/components/"* || "$file" == *"/modules/"* || "$file" == *"/plugins/"* || "$file" == *"/templates/"* || "$file" == *"/node_modules/"* || "$file" == *"/vendor/"* || "$file" == *"/wp-includes/"* ]]; then
        continue
    fi

    if [[ "$file" == *"/libraries/src/Version.php" || "$file" == *"/libraries/joomla/version.php" || "$file" == *"/libraries/cms/version.php" || "$file" == *"/libraries/cms/version/version.php" || "$file" == *"/includes/version.php" ]]; then
        
        j_version=""
        if grep -q "MAJOR_VERSION" "$file" 2>/dev/null; then
            j_major=$(grep -w "MAJOR_VERSION" "$file" | head -n1 | tr -dc '0-9')
            j_minor=$(grep -w "MINOR_VERSION" "$file" | head -n1 | tr -dc '0-9')
            j_patch=$(grep -w "PATCH_VERSION" "$file" | head -n1 | tr -dc '0-9')
            [ ! -z "$j_major" ] && j_version="${j_major}.${j_minor:-0}.${j_patch:-0}"
        fi
        
        if [ -z "$j_version" ]; then
            j_rel=$(sed -n "s/.*RELEASE.*['\"]\(.*\)['\"].*/\1/p" "$file" | tr -d '[:space:]')
            j_dev=$(sed -n "s/.*DEV_LEVEL.*['\"]\(.*\)['\"].*/\1/p" "$file" | tr -d '[:space:]')
            [ -z "$j_rel" ] && j_rel=$(sed -n "s/.*\$RELEASE.*=\s*\(.*\);/\1/p" "$file" | tr -d "';\" ")
            [ -z "$j_dev" ] && j_dev=$(sed -n "s/.*\$DEV_LEVEL.*=\s*\(.*\);/\1/p" "$file" | tr -d "';\" ")
            if [ ! -z "$j_rel" ]; then j_version="${j_rel}.${j_dev:-0}"; fi
        fi
        
        [ -z "$j_version" ] && j_version="Unknown"

        path="${file%/[Vv]ersion.php}"
        path="${path%/libraries/src}"; path="${path%/libraries/joomla}"; path="${path%/libraries/cms/version}"; path="${path%/libraries/cms}"; path="${path%/includes}"
        
        if [[ "$path" == *"/home/"* ]]; then
            username=$(echo "$path" | awk -F'/home/' '{print $2}' | awk -F'/' '{print $1}')
        elif [[ "$path" == *"/var/www/vhosts/"* ]]; then
            username=$(echo "$path" | awk -F'/var/www/vhosts/' '{print $2}' | awk -F'/' '{print $1}')
        else
            username="system_root"
        fi

        site_slug=$(echo "$path" | sed 's|/|_|g' | sed 's|^_||')
        USER_DIR="$REPORT_DIR/$username"
        mkdir -p "$USER_DIR"
        REPORT_FILE="$USER_DIR/${site_slug}.txt"

        echo "==========================================" > "$REPORT_FILE"
        echo " Website Path : $path" >> "$REPORT_FILE"
        echo " Core Version : $j_version" >> "$REPORT_FILE"
        echo -e "==========================================\n" >> "$REPORT_FILE"

        if [ "$FIRST_SITE" = true ]; then
            FIRST_SITE=false
        else
            echo "," >> "$JSON_FILE"
        fi

        echo "    {" >> "$JSON_FILE"
        echo "      \"username\": \"$username\"," >> "$JSON_FILE"
        echo "      \"path\": \"$path\"," >> "$JSON_FILE"
        echo "      \"core_version\": \"$j_version\"," >> "$JSON_FILE"
        echo "      \"extensions\": [" >> "$JSON_FILE"

        FIRST_EXT=true

# ==============================================================================
# Step 6: Scanning plugin XML manifests and full string cleansing.
# ==============================================================================
# --- Step 6: XML Manifest Extraction & String Cleansing ---

        find "$path" -maxdepth 5 -type f -name "*.xml" 2>/dev/null | while read -r xml_file; do
            if grep -qE "<extension|<install|<metafile" "$xml_file" 2>/dev/null; then
                if [[ "$xml_file" == *"/components/"* || "$xml_file" == *"/modules/"* || "$xml_file" == *"/plugins/"* || "$xml_file" == *"/templates/"* ]]; then
                    
                    ext_element=$(sed -n "s/.*<element>\(.*\)<\/element>.*/\1/p" "$xml_file" | head -n1 | sed 's/<[^>]*>//g' | tr -d '\r' | xargs -r 2>/dev/null)
                    ext_name=$(sed -n "s/.*<name>\(.*\)<\/name>.*/\1/p" "$xml_file" | head -n1 | sed 's/<[^>]*>//g' | tr -d '\r' | xargs -r 2>/dev/null)
                    ext_ver=$(sed -n "s/.*<version>\(.*\)<\/version>.*/\1/p" "$xml_file" | head -n1 | sed 's/<[^>]*>//g' | tr -d '\r' | xargs -r 2>/dev/null)
                    ext_author=$(sed -n "s/.*<author>\(.*\)<\/author>.*/\1/p" "$xml_file" | head -n1 | sed 's/<[^>]*>//g' | tr -d '\r' | xargs -r 2>/dev/null)
                    
                    match_element=$(echo "$ext_element" | tr '[:upper:]' '[:lower:]' | tr -d '[:space:]\r' | xargs)
                    match_name=$(echo "$ext_name" | tr '[:upper:]' '[:lower:]' | tr -d '[:space:]\r' | xargs)

                    if [ -z "$match_element" ]; then
                        match_element=$(basename "$xml_file" .xml | tr '[:upper:]' '[:lower:]' | tr -d '[:space:]\r')
                    fi

                    # Layer 1: Exact string lookup exclusions from file
                    if [ -f "$FILTER_FILE" ]; then
                        if grep -Fqx "$match_element" "$FILTER_FILE" || grep -Fqx "$match_name" "$FILTER_FILE"; then
                            continue
                        fi
                    fi
                    
                    # Layer 2: Author signature exclusions
                    if [[ "$ext_author" == *"Joomla! Project"* || "$ext_author" == *"Joomla!"* ]]; then
                        continue
                    fi
                    
                    if [[ "$xml_file" == *"/components/"* ]]; then ext_type="Component";
                    elif [[ "$xml_file" == *"/modules/"* ]]; then ext_type="Module";
                    elif [[ "$xml_file" == *"/plugins/"* ]]; then ext_type="Plugin";
                    elif [[ "$xml_file" == *"/templates/"* ]]; then ext_type="Template";
                    fi

# ==============================================================================
# Step 7: Commercial plugin filtering engine and offline version matching from the text database.
# ==============================================================================
# --- Step 7: Commercial Database Matcher Tier ---

                    if [ ! -z "$ext_name" ] && [ ! -z "$ext_ver" ]; then
                        clean_name=$(echo "$ext_name" | sed 's/"/\\"/g' | tr -d '\r' | xargs)
                        clean_version=$(echo "$ext_ver" | tr -d '[:space:]\r' | xargs)
                        
                        site_major_version=$(echo "$j_version" | cut -d'.' -f1 | tr -d '[:space:]')
                        [ -z "$site_major_version" ] || [ "$site_major_version" = "Unknown" ] && site_major_version="3"
                        
                        latest_ver="Unknown"
                        is_resolved=false

                        # EXTRACT LIVE UPDATE URL: Pull directly from extension's XML manifest file
                        ext_update_url=$(grep -zPo '(?is)<server[^>]*>\s*\Khttps?://[^<\s]+' "$xml_file" | head -n1 | sed 's/&amp;/\&/g' | tr -d '[:space:]\r' | xargs -r 2>/dev/null)
                        
                        if [ ! -z "$ext_update_url" ] && [ "$ext_update_url" != "None" ]; then
                            # Append active website's core Joomla version parameter to the remote feed endpoint string
                            if [[ "$ext_update_url" == *"?"* ]]; then
                                final_request_url="${ext_update_url}&jver=${j_version}&element=${match_element}"
                            else
                                final_request_url="${ext_update_url}?jver=${j_version}&element=${match_element}"
                            fi

                            # Fetch live payload using a high-fidelity Chrome browser identity simulation
                            xml_payload=$(curl -sSLk --max-time 4 -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36" "$final_request_url" 2>/dev/null)
                            
                            if [ ! -z "$xml_payload" ]; then
                                xml_clean=$(echo "$xml_payload" | sed 's/<!\[CDATA\[//g; s/\]\]>//g' | tr -d '\r')

                                # TIER 1: Search inside update nodes matching active site targetplatform version bounds
                                if echo "$xml_clean" | grep -q "targetplatform" 2>/dev/null; then
                                    extracted_ver=$(echo "$xml_clean" | grep -zPo "(?is)<update>.*?targetplatform[^>]*version=\"\s*${site_major_version}\b.*?<version>\s*\K[^<\s]+" 2>/dev/null | tr -d '[:space:]\0\r' | sort -V | tail -n1 | xargs -r 2>/dev/null)
                                fi
                                # TIER 2: Match global semantic version element tags directly
                                if [ -z "$extracted_ver" ] ; then
                                    extracted_ver=$(echo "$xml_clean" | grep -zPo '(?is)<version>\s*\K[^<\s]+' 2>/dev/null | tr -d '[:space:]\0\r' | sort -V | tail -n1 | xargs -r 2>/dev/null)
                                fi
                                
                                if [ ! -z "$extracted_ver" ]; then
                                    latest_ver=$(echo "$extracted_ver" | tr -d '[:space:]\r' | xargs)
                                    is_resolved=true
                                else
                                    latest_ver="Feed Parse Error"
                                fi
                            else
                                latest_ver="Server Unreachable"
                            fi
                        else
                            latest_ver="No Update Feed"
                        fi

# ==============================================================================
# Step 8: Live Internet Download Engine (cURL Fallback) and Version Ceiling Guard Layer
# ==============================================================================
# --- Step 8: Live Fallback, Ceiling Guard & Bash Loop Closures ---

                        # PRIORITY 2 FALLBACK: If live server fetching failed or returned errors, query text database files
                        if [ "$is_resolved" = false ]; then
                            # Map out package suites to handle nested sub-plugins wildcard lookups
                            lookup_element="$match_element"
                            if [[ "$match_element" == *"hikashop"* ]] || [[ "$match_name" == *"hikashop"* ]]; then lookup_element="hikashop";
                            elif [[ "$match_element" == *"fabrik"* ]] || [[ "$xml_file" == *"/fabrik/"* ]] || [[ "$match_name" == *"fabrik"* ]]; then lookup_element="fabrik";
                            elif [[ "$match_element" == *"acymailing"* ]] || [[ "$match_element" == *"acym"* ]] || [[ "$match_name" == *"acymailing"* ]]; then
                                if [[ "$match_element" == *"acym"* ]]; then lookup_element="acym"; else lookup_element="acymailing"; fi
                            elif [[ "$match_element" == *"yootheme"* ]] || [[ "$match_name" == *"yootheme"* ]] || [[ "$match_element" == *"location"* ]] || [[ "$match_element" == *"mediafile"* ]]; then lookup_element="yootheme";
                            elif [[ "$match_element" == *"lscache"* ]] || [[ "$match_element" == *"liteweb"* ]] || [[ "$match_element" == *"litespeed"* ]] || [[ "$match_element" == *"purge"* ]]; then
                                if [[ "$match_element" == *"purge"* ]]; then lookup_element="purge"; else lookup_element="lscache"; fi
                            elif [[ "$match_element" == *"smartslider"* ]] || [[ "$match_element" == *"nextend"* ]] || [[ "$match_name" == *"smartslider"* ]]; then
                                if [[ "$match_element" == *"nextend"* ]]; then lookup_element="nextend"; else lookup_element="smartslider"; fi
                            elif [[ "$match_element" == *"djclassifieds"* ]] || [[ "$match_name" == *"djclassifieds"* ]]; then lookup_element="djclassifieds";
                            fi

                            if [ -f "$COMMERCIAL_DB_FILE" ]; then
                                # Query the database using active Joomla major version rows matching element tags
                                db_match=$(grep -iE "^(${lookup_element})\|${site_major_version}\|" "$COMMERCIAL_DB_FILE" | head -n1)
                                
                                # Automatic ceiling fallback scaling for future upcoming Joomla releases
                                if [ -z "$db_match" ] && [ "$site_major_version" -gt 5 ]; then
                                    db_match=$(grep -iE "^(${lookup_element})\|\|" "$COMMERCIAL_DB_FILE" | tail -n1)
                                fi
                                # Query matching manifest name fallback parameters
                                if [ -z "$db_match" ]; then
                                    db_match=$(grep -iE "^(${match_name})\|${site_major_version}\|" "$COMMERCIAL_DB_FILE" | head -n1)
                                fi

                                if [ ! -z "$db_match" ]; then
                                    latest_ver=$(echo "$db_match" | cut -d'|' -f3 | tr -d '[:space:]\r' | xargs)
                                    is_resolved=true
                                fi
                            fi
                        fi
                        
                        latest_ver=$(echo "$latest_ver" | tr -d '[:space:]\r' | xargs)
                        
                        # Dynamic Ceiling Guard Safety Filter Block Check
                        if [[ "$latest_ver" =~ ^[0-9] ]] && [[ "$clean_version" =~ ^[0-9] ]]; then
                            if [ "$(printf '%s\n%s' "$latest_ver" "$clean_version" | sort -V | tail -n1)" = "$clean_version" ]; then
                                latest_ver="$clean_version"
                            fi
                        fi
                        
                        printf "[%-9s] %-30s | Installed: %s | Latest: %s\n" "$ext_type" "$ext_name" "$clean_version" "$latest_ver" >> "$REPORT_FILE"

                        if [ "$FIRST_EXT" = true ]; then
                            FIRST_EXT=false
                        else
                            echo "," >> "$JSON_FILE"
                        fi
                        echo "        { \"type\": \"$ext_type\", \"name\": \"$clean_name\", \"version\": \"$clean_version\", \"latest_version\": \"$latest_ver\" }" >> "$JSON_FILE"
                    fi
                fi
            fi
        done
        echo "      ]" >> "$JSON_FILE"
        echo -n "    }" >> "$JSON_FILE"
        echo -e "\e[32m[✓]\e[0m Discovered Joomla site at: $path (V: $j_version)"
    fi
done

echo "" >> "$JSON_FILE"
echo "  ]" >> "$JSON_FILE"
echo "}" >> "$JSON_FILE"

# ==============================================================================
# Step 9: Compiling the dashboard's graphical shell and the HTML template's CSS styles.
# ==============================================================================
# --- Step 9: HTML Visual Presentation Skin Compilation ---

echo -e "\e[33m[*]\e[0m Compiling Consolidated HTML Presentation Skin..."

cat << 'EOF' > "$HTML_FILE"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Server CMS Scan Dashboard</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f8f9fa; margin: 40px; color: #333; line-height: 1.5; }
        .container { max-width: 1200px; margin: 0 auto; }
        header { background: #1e293b; color: #fff; padding: 25px 30px; border-radius: 8px; margin-bottom: 20px; box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1); }
        header h1 { margin: 0; font-size: 26px; letter-spacing: -0.5px; }
        .meta-grid { display: flex; gap: 40px; margin-top: 15px; font-size: 14px; opacity: 0.85; }
        .meta-grid a { color: #38bdf8; text-decoration: none; }
        .meta-grid a:hover { text-decoration: underline; }
        .control-bar { background: #fff; border: 1px solid #e2e8f0; padding: 15px 20px; border-radius: 8px; margin-bottom: 20px; display: flex; flex-wrap: wrap; gap: 15px; align-items: center; box-shadow: 0 1px 3px rgba(0,0,0,0.05); }
        .btn-filter { background: #64748b; color: #fff; border: none; padding: 8px 16px; border-radius: 6px; font-size: 13px; font-weight: 600; cursor: pointer; transition: background 0.2s; white-space: nowrap; }
        .btn-filter.active { background: #ef4444; }
        .btn-filter.action-btn { background: #0284c7; }
        .btn-filter.action-btn:hover { background: #0369a1; }
        .ai-panel { background: #f0fdf4; border: 1px solid #bbf7d0; border-radius: 8px; padding: 15px 20px; margin-bottom: 25px; display: flex; justify-content: space-between; align-items: center; }
        .ai-title { display: flex; align-items: center; gap: 10px; font-weight: 600; color: #166534; font-size: 14px; }
        .btn-ai { background: #16a34a; color: white; border: none; padding: 8px 18px; border-radius: 6px; font-size: 13px; font-weight: 600; cursor: pointer; }
        .btn-ai:hover { background: #15803d; }
        .modal-overlay { display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(15,23,42,0.6); z-index: 1000; backdrop-filter: blur(4px); align-items: center; justify-content: center; }
        .modal-box { background: white; padding: 30px; border-radius: 12px; max-width: 600px; width: 90%; box-shadow: 0 20px 25px rgba(0,0,0,0.1); position: relative; }
        .modal-header { font-size: 18px; font-weight: bold; color: #1e293b; margin-bottom: 15px; border-bottom: 1px solid #f1f5f9; padding-bottom: 10px; display: flex; justify-content: space-between; align-items: center; }
        .modal-close { cursor: pointer; color: #94a3b8; font-size: 20px; font-weight: bold; border: none; background: none; }
        .metrics-grid { display: grid; grid-template-columns: repeat(2, 1fr); gap: 15px; margin-bottom: 20px; }
        .metric-card { background: #f8fafc; border: 1px solid #e2e8f0; padding: 15px; border-radius: 8px; text-align: center; }
        .metric-val { font-size: 24px; font-weight: bold; }
        .val-secure { color: #16a34a; }
        .val-danger { color: #dc2626; }
        .metric-lbl { font-size: 11px; color: #64748b; font-weight: 600; text-transform: uppercase; margin-top: 5px; }
        .ai-verdict { background: #f1f5f9; padding: 15px; border-radius: 8px; font-size: 13.5px; color: #334155; border-left: 4px solid #16a34a; line-height: 1.6; }
        .search-box { flex-grow: 1; min-width: 250px; }
        .search-box input { width: 100%; padding: 8px 15px; border: 1px solid #cbd5e1; border-radius: 6px; font-size: 13px; outline: none; box-sizing: border-box; }
        .user-section { background: #fff; border: 1px solid #e2e8f0; border-radius: 8px; margin-bottom: 15px; box-shadow: 0 1px 3px rgba(0,0,0,0.05); overflow: hidden; }
        .user-trigger { background: #f1f5f9; padding: 15px 20px; font-weight: bold; font-size: 16px; color: #1e293b; cursor: pointer; display: flex; justify-content: space-between; align-items: center; user-select: none; }
        .user-trigger span.uname { color: #ef4444; }
        .user-content { display: none; padding: 15px 20px; background: #fafafa; border-top: 1px solid #e2e8f0; }
        .site-block { background: #fff; border: 1px solid #cbd5e1; border-radius: 6px; margin-bottom: 15px; overflow: hidden; }
        .site-trigger { background: #f8fafc; padding: 12px 15px; font-size: 14px; font-weight: 600; color: #334155; cursor: pointer; display: flex; justify-content: space-between; align-items: center; user-select: none; }
        .site-content { display: none; padding: 15px; background: #fff; border-top: 1px solid #cbd5e1; }
        .user-section.is-secure { border-color: #bbf7d0; }
        .user-section.is-secure > .user-trigger { background: #f0fdf4; color: #166534; }
        .user-section.is-secure > .user-trigger span.uname { color: #15803d; }
        .site-block.is-secure { border-color: #bbf7d0; }
        .site-block.is-secure > .site-trigger { background: #f0fdf4; color: #166534; }
        .badge-secure-status { display: inline-block; background: #15803d; color: #fff; padding: 3px 10px; border-radius: 9999px; font-size: 11px; font-weight: bold; margin-right: 10px; }
        .type-section { border-left: 3px solid #64748b; margin-bottom: 12px; }
        .type-section.Component { border-left-color: #ea580c; }
        .type-section.Plugin { border-left-color: #9333ea; }
        .type-section.Module { border-left-color: #16a34a; }
        .type-section.Template { border-left-color: #475569; }
        .type-trigger { padding: 8px 12px; font-size: 13px; font-weight: 600; cursor: pointer; display: flex; justify-content: space-between; background: #f8fafc; user-select: none; }
        .type-trigger.Component { color: #ea580c; }
        .type-trigger.Plugin { color: #9333ea; }
        .type-trigger.Module { color: #16a34a; font-weight: 600; }
        .type-trigger.Template { color: #475569; }
        .type-content { display: none; padding: 5px 0 5px 12px; }
        table { width: 100%; border-collapse: collapse; text-align: left; margin-top: 5px; }
        th, td { padding: 10px 15px; font-size: 13px; border-bottom: 1px solid #f1f5f9; }
        th { background: #f8fafc; font-weight: 600; color: #64748b; text-transform: uppercase; font-size: 11px; }
        .status-badge { display: inline-block; padding: 2px 8px; border-radius: 4px; font-size: 11px; font-weight: bold; }
        .status-current { background: #dcfce7; color: #15803d; }
        .status-update { background: #fef3c7; color: #d97706; animation: pulse 2s infinite; }
        .status-unknown { background: #f1f5f9; color: #94a3b8; font-weight: normal; }
        .badge-core { display: inline-block; background: #2563eb; color: #fff; padding: 3px 10px; border-radius: 9999px; font-size: 12px; font-weight: 600; }
        .badge-core.eol { background: #dc2626; animation: pulse 1.5s infinite; }
        @keyframes pulse { 0% { opacity: 1; } 50% { opacity: 0.7; } 100% { opacity: 1; } }
        .btn-master-copy { background: #0284c7; color: white; border: none; padding: 5px 12px; border-radius: 6px; font-size: 12px; cursor: pointer; font-weight: 600; margin-right: 15px; }
        .badge-count { background: #64748b; color: #fff; padding: 2px 8px; border-radius: 12px; font-size: 11px; font-weight: 600; }
        .no-ext { padding: 15px; text-align: center; color: #94a3b8; font-style: italic; font-size: 13px; background: #fff; }
        .arrow::after { content: ' ❯'; display: inline-block; transition: transform 0.2s; font-size: 11px; margin-left: 8px; }
        .active > .arrow::after { transform: rotate(90deg); }
        footer { margin-top: 50px; text-align: center; font-size: 13px; color: #64748b; border-top: 1px solid #e2e8f0; padding-top: 20px; }
    </style>
</head>
EOF

# ==============================================================================
# Step 10: Dashboard Control Bar Header Body and Script Opening Tag (CRITICAL RUNTIME OPENER)
# ==============================================================================
# --- Step 10: HTML Body Layouts & Scripts Initialization ---

CURRENT_SCAN_DATE=$(date)

cat << EOF >> "$HTML_FILE"
<body>
<div class="container">
    <header>
        <h1>Joomla Auditing & Inventory Dashboard</h1>
        <div class="meta-grid">
            <div><strong>Scan Run:</strong> ${CURRENT_SCAN_DATE}</div>
            <div><strong>Author:</strong> MAHDI AHAZAN</div>
            <div><strong>GitHub:</strong> <a href="https://github.com/MahdiAhazan/Joomla-Scanner" target="_blank">https://github.com/MahdiAhazan/Joomla-Scanner</a></div>
        </div>
    </header>
    
    <div class="ai-panel">
        <div class="ai-title">
            <span style="font-size:18px;">🤖</span>
            <div>
                <strong>AI Audit & Verification Assistant</strong>
                <div style="font-size:12px; color:#16a34a; font-weight:normal;">Asynchronous telemetry assessment engine for realistic data verification check.</div>
            </div>
        </div>
        <button id="run-ai-check" class="btn-ai">Run AI Verification Check</button>
    </div>

    <div class="control-bar">
        <button id="toggle-filter" class="btn-filter">Show Outdated / Vulnerable Only</button>
        <button id="expand-all" class="btn-filter action-btn">Expand All</button>
        <button id="collapse-all" class="btn-filter action-btn" style="background:#475569;">Collapse All</button>
        <div class="search-box">
            <input type="text" id="extension-search" placeholder="Type extension name to locate across all sites...">
        </div>
    </div>

    <div id="ai-modal" class="modal-overlay">
        <div class="modal-box">
            <div class="modal-header">
                <div>🤖 Realistic Data Audit Report</div>
                <button class="modal-close" id="close-ai-modal">&times;</button>
            </div>
            <div class="metrics-grid">
                <div class="metric-card">
                    <div class="metric-val val-secure" id="ai-score">0%</div>
                    <div class="metric-lbl">Server Health Score</div>
                </div>
                <div class="metric-card">
                    <div class="metric-val val-danger" id="ai-error-rate">0%</div>
                    <div class="metric-lbl">Estimated Error Rate</div>
                </div>
            </div>
            <div class="ai-verdict" id="ai-verdict-text">
                Initializing mathematical verification pipelines...
            </div>
        </div>
    </div>

    <div id="content-anchor"></div>

<script>
    const reportData = 
EOF

# Stream the raw JSON content directly into variable footprint anchor
cat "$JSON_FILE" >> "$HTML_FILE"

# ==============================================================================
# Step 11: Packaging data variables and the streamlined aggregation engine – Customer email copy
# ==============================================================================
# --- Step 11: Variable Closure & Consolidated Master Email Template ---

cat << 'EOF' >> "$HTML_FILE"
;
    const container = document.getElementById('content-anchor');
    let filterMode = false;

    function isCoreEOL(version) {
        if (!version || version === "Unknown") return false;
        const major = parseInt(version.split('.'));
        return major <= 3;
    }

    function copyConsolidatedReport(username, path, coreVersion, extensionsArray) {
        const outdatedItems = extensionsArray.filter(ext => {
            const status = String(ext.latest_version).toLowerCase();
            if (status.includes('feed') || status.includes('error') || status.includes('unreachable') || status.includes('unknown')) return false;
            return ext.version.trim() !== ext.latest_version.trim();
        });

        const coreEolAlert = isCoreEOL(coreVersion) ? " [⚠️ CRITICAL: THIS JOOMLA CORE IS END-OF-LIFE AND NO LONGER SUPPORTED]" : "";

        let emailBody = `Subject: Security Alert: Consolidated Updates Required for Your Website\n\n`;
        emailBody += `Dear Client,\n\n`;
        emailBody += `During our routine server-wide automated security auditing, we analyzed your active website installation and discovered software components that require immediate maintenance.\n\n`;
        emailBody += `=== WEBSITE PROFILE ===\n`;
        emailBody += `Account User : ${username}\n`;
        emailBody += `System Path  : ${path}\n`;
        emailBody += `Core Version : Joomla ${coreVersion}${coreEolAlert}\n\n`;

        if (outdatedItems.length === 0) {
            emailBody += `All analyzed custom 3rd-party software extensions inside this system environment are fully up to date.\n`;
        } else {
            emailBody += `=== OUTDATED EXTENSIONS MATRIX ===\n`;
            emailBody += `------------------------------------------------------------------------\n`;
            emailBody += `Type        | Extension Name                 | Installed | Latest   \n`;
            emailBody += `------------------------------------------------------------------------\n`;
            outdatedItems.forEach(item => {
                emailBody += `${item.type.padEnd(11, ' ')} | ${item.name.substring(0, 30).padEnd(30, ' ')} | ${item.version.substring(0, 9).padEnd(9, ' ')} | ${item.latest_version}\n`;
            });
            emailBody += `------------------------------------------------------------------------\n\n`;
            emailBody += `Action Required:\nPlease log in to your Joomla control panel and apply the required security patches.\n`;
        }
        emailBody += `\nBest Regards,\nServer Security Team`;

        navigator.clipboard.writeText(emailBody).then(() => {
            alert(`Consolidated report copied to clipboard!`);
        }).catch(() => {
            alert('Failed to copy to clipboard.');
        });
    }
EOF

# ==============================================================================
# Step 12: Server User Node Tree Render Sub-step
# ==============================================================================
# --- HTML Report Generation: Step 12 (User Node Tree Render) ---

cat << 'EOF' >> "$HTML_FILE"
    function renderDashboardTree() {
        if (!reportData.websites || reportData.websites.length === 0) {
            container.innerHTML = '<div class="user-section" style="padding:40px; text-align:center; color:#64748b;">No active Joomla CMS footprints found on this server.</div>';
            return;
        }

        const userGroups = {};
        reportData.websites.forEach(site => {
            if (!userGroups[site.username]) userGroups[site.username] = [];
            userGroups[site.username].push(site);
        });

        let userCounter = 0;
        Object.keys(userGroups).forEach(username => {
            const sites = userGroups[username];
            userCounter++;
            const userSectionId = `user-sec-${userCounter}`;
            
            const userSection = document.createElement('div');
            userSection.className = 'user-section';
            userSection.id = userSectionId;
            userSection.setAttribute('data-has-vuln', 'false');
            
            const userTrigger = document.createElement('div');
            userTrigger.className = 'user-trigger arrow';
            userTrigger.innerHTML = `<div>User Root: <span class="uname">${username}</span></div> <span class="badge-count">${sites.length} Instance(s)</span>`;
            
            const userContent = document.createElement('div');
            userContent.className = 'user-content';
EOF

# ==============================================================================
# Step 13: Website Main Frame Rendering Sub-step in the Client Tree (Website Frame Builder)
# ==============================================================================
# --- HTML Report Generation: Step 13 (Website Frame Builder) ---

cat << 'EOF' >> "$HTML_FILE"
            let siteCounter = 0;
            sites.forEach(site => {
                siteCounter++;
                const siteBlockId = `${userSectionId}-site-${siteCounter}`;
                const siteBlock = document.createElement('div');
                siteBlock.className = 'site-block';
                siteBlock.id = siteBlockId;
                siteBlock.setAttribute('data-has-vuln', 'false');
                
                const eolStatus = isCoreEOL(site.core_version);
                const coreBadgeClass = eolStatus ? 'badge-core eol' : 'badge-core';
                const coreBadgeText = eolStatus ? `Joomla ${site.core_version} [⚠️ OUT OF SUPPORT]` : `Joomla ${site.core_version}`;
                
                if (eolStatus) {
                    siteBlock.setAttribute('data-has-vuln', 'true');
                    userSection.setAttribute('data-has-vuln', 'true');
                }

                const siteTrigger = document.createElement('div');
                siteTrigger.className = 'site-trigger arrow';
                siteTrigger.innerHTML = `
                    <div>Path: <code>${site.path}</code></div> 
                    <div style="display:flex; align-items:center;" class="badge-zone">
                        <button class="btn-master-copy" id="master-btn-${siteBlockId}">Copy Site Alert Email</button>
                        <span class="${coreBadgeClass}">${coreBadgeText}</span>
                    </div>`;
                
                setTimeout(() => {
                    const btn = document.getElementById(`master-btn-${siteBlockId}`);
                    if (btn) {
                        btn.addEventListener('click', (e) => {
                            e.stopPropagation();
                            copyConsolidatedReport(site.username, site.path, site.core_version, site.extensions || []);
                        });
                    }
                }, 10);

                const siteContent = document.createElement('div');
                siteContent.className = 'site-content';
EOF

# ==============================================================================
# Step 14: Sub-step for dynamic rendering of client tables and marking secure states (Secure State Post-Renderer)
# ==============================================================================
# --- HTML Report Generation: Step 14 (Secure State Post-Renderer) ---

cat << 'EOF' >> "$HTML_FILE"
                if (!site.extensions || site.extensions.length === 0) {
                    siteContent.innerHTML = '<div class="no-ext">No 3rd-party non-core custom extensions installed.</div>';
                } else {
                    const typeGroups = { Component: [], Plugin: [], Module: [], Template: [] };
                    site.extensions.forEach(ext => {
                        if (typeGroups[ext.type]) typeGroups[ext.type].push(ext);
                    });
                    
                    let extCounter = 0;
                    Object.keys(typeGroups).forEach(type => {
                        const items = typeGroups[type];
                        if (items.length === 0) return;
                        
                        const typeSection = document.createElement('div');
                        typeSection.className = `type-section ${type}`;
                        
                        const typeTrigger = document.createElement('div');
                        typeTrigger.className = `type-trigger arrow ${type}`;
                        typeTrigger.innerHTML = `<div>${type}s</div> <span class="badge-count">${items.length}</span>`;
                        
                        const typeContent = document.createElement('div');
                        typeContent.className = 'type-content';
                        
                        let tableHTML = '<table><thead><tr><th width="45%">Extension Name</th><th width="20%">Installed Version</th><th width="35%">Status / Latest Release</th></tr></thead><tbody>';
                        
                        items.forEach(item => {
                            extCounter++;
                            const rowId = `${siteBlockId}-row-${extCounter}`;
                            let badgeClass = "status-badge status-unknown";
                            let badgeText = item.latest_version;
                            let rowStatus = "clean";
                            
                            const checkRaw = String(item.latest_version).trim().toLowerCase();
                            const cleanCurrent = String(item.version).trim();
                            const cleanLatest = String(item.latest_version).trim();

                            const isTextError = checkRaw.includes('feed') || checkRaw.includes('error') || checkRaw.includes('unreachable') || checkRaw.includes('unknown') || checkRaw === '';

                            if (isTextError) {
                                badgeClass = "status-badge status-unknown";
                                badgeText = item.latest_version === "NoUpdateFeed" ? "No Update Feed" : item.latest_version;
                            } else if (cleanCurrent === cleanLatest) {
                                badgeClass = "status-badge status-current";
                                badgeText = `Up to date (${cleanLatest})`;
                            } else {
                                if (/^[0-9]/.test(cleanLatest)) {
                                    badgeClass = "status-badge status-update";
                                    badgeText = `Update Available! (${cleanLatest})`;
                                    rowStatus = "vulnerable";
                                    
                                    siteBlock.setAttribute('data-has-vuln', 'true');
                                    userSection.setAttribute('data-has-vuln', 'true');
                                } else {
                                    badgeClass = "status-badge status-unknown";
                                }
                            }

                            tableHTML += `<tr id="${rowId}" data-status="${rowStatus}">
                                <td>${item.name}</td>
                                <td><strong>${item.version}</strong></td>
                                <td><span class="${badgeClass}">${badgeText}</span></td>
                            </tr>`;
                        });
                        
                        tableHTML += '</tbody></table>';
                        typeContent.innerHTML = tableHTML;
                        
                        typeTrigger.addEventListener('click', (e) => {
                            e.stopPropagation();
                            const isOpen = typeContent.style.display === 'block';
                            typeContent.style.display = isOpen ? 'none' : 'block';
                            typeTrigger.classList.toggle('active', !isOpen);
                        });
                        
                        typeSection.appendChild(typeTrigger);
                        typeSection.appendChild(typeContent);
                        siteContent.appendChild(typeSection);
                    });
                }
                
                siteTrigger.addEventListener('click', (e) => {
                    const isOpen = siteContent.style.display === 'block';
                    siteContent.style.display = isOpen ? 'none' : 'block';
                    siteTrigger.classList.toggle('active', !isOpen);
                });
                
                if (siteBlock.getAttribute('data-has-vuln') === 'false') {
                    siteBlock.classList.add('is-secure');
                    const badgeZone = siteTrigger.querySelector('.badge-zone');
                    const secureBadge = document.createElement('span');
                    secureBadge.className = 'badge-secure-status';
                    secureBadge.innerText = '✓ Secure';
                    badgeZone.insertBefore(secureBadge, badgeZone.firstChild);
                }
                
                siteBlock.appendChild(siteTrigger);
                siteBlock.appendChild(siteContent);
                userContent.appendChild(siteBlock);
            });
            
            userTrigger.addEventListener('click', () => {
                const isOpen = userContent.style.display === 'block';
                userContent.style.display = isOpen ? 'none' : 'block';
                userTrigger.classList.toggle('active', !isOpen);
            });
            
            if (userSection.getAttribute('data-has-vuln') === 'false') {
                userSection.classList.add('is-secure');
                userTrigger.innerHTML = `<div>User Root: <span class="uname">${username}</span> <span class="badge-secure-status" style="margin-left:15px;">✓ Secure Account</span></div> <span class="badge-count" style="background:#15803d;">${sites.length} Instance(s)</span>`;
            }
            
            userSection.appendChild(userTrigger);
            userSection.appendChild(userContent);
            container.appendChild(userSection);
        });
    }
EOF

# ==============================================================================
# Step 15: Bulk menu control buttons and the Auto-Expand dynamic filter engine.
# ==============================================================================
# --- HTML Report Generation: Step 15 (Auto-Expand Trigger Rules) ---

cat << 'EOF' >> "$HTML_FILE"
    function toggleBlockView(triggerElement, contentElement, forceOpen = null) {
        const isOpen = forceOpen !== null ? !forceOpen : contentElement.style.display === 'block';
        contentElement.style.display = isOpen ? 'none' : 'block';
        triggerElement.classList.toggle('active', !isOpen);
    }

    function setGlobalAccordionState(openState) {
        const displayValue = openState ? 'block' : 'none';
        document.querySelectorAll('.user-content, .site-content, .type-content').forEach(content => {
            content.style.display = displayValue;
        });
        document.querySelectorAll('.user-trigger, .site-trigger, .type-trigger').forEach(trigger => {
            trigger.classList.toggle('active', openState);
        });
    }

    document.getElementById('toggle-filter').addEventListener('click', function() {
        filterMode = !filterMode;
        this.classList.toggle('active', filterMode);
        
        if (filterMode) {
            setGlobalAccordionState(false);
            document.querySelectorAll('.user-section').forEach(sec => {
                const hasVuln = sec.getAttribute('data-has-vuln') === 'true';
                sec.style.display = hasVuln ? 'block' : 'none';
                if (hasVuln) toggleBlockView(sec.querySelector('.user-trigger'), sec.querySelector('.user-content'), true);
            });

            document.querySelectorAll('.site-block').forEach(blk => {
                const hasVuln = blk.getAttribute('data-has-vuln') === 'true';
                blk.style.display = hasVuln ? 'block' : 'none';
                if (hasVuln) {
                    toggleBlockView(blk.querySelector('.site-trigger'), blk.querySelector('.site-content'), true);
                    blk.querySelectorAll('.type-section').forEach(typeSec => {
                        if (typeSec.querySelectorAll('tr[data-status="vulnerable"]').length > 0) {
                            toggleBlockView(typeSec.querySelector('.type-trigger'), typeSec.querySelector('.type-content'), true);
                        }
                    });
                }
            });

            document.querySelectorAll('tr[data-status]').forEach(row => {
                row.style.display = (row.getAttribute('data-status') === 'vulnerable') ? 'table-row' : 'none';
            });
        } else {
            document.querySelectorAll('.user-section, .site-block, tr[data-status]').forEach(el => {
                el.style.display = el.tagName === 'TR' ? 'table-row' : 'block';
            });
            setGlobalAccordionState(false);
        }
    });

    document.getElementById('expand-all').addEventListener('click', () => setGlobalAccordionState(true));
    document.getElementById('collapse-all').addEventListener('click', () => setGlobalAccordionState(false));
EOF

# ==============================================================================
# Step 16: Filter Engine and Server-Wide Live Search (Live Search Column Isolation)
# ==============================================================================
# --- HTML Report Generation: Step 16 (Live Search Column Isolation) ---

cat << 'EOF' >> "$HTML_FILE"
    // Live Search Filter Engine
    document.getElementById('extension-search').addEventListener('input', function(e) {
        const query = e.target.value.trim().toLowerCase();
        
        if (query === '') {
            document.querySelectorAll('.user-section, .site-block, .type-section, tr[data-status]').forEach(el => {
                el.style.display = el.tagName === 'TR' ? 'table-row' : 'block';
            });
            setGlobalAccordionState(false);
            return;
        }

        document.querySelectorAll('.user-section').forEach(userSec => {
            let userHasMatch = false;
            userSec.querySelectorAll('.site-block').forEach(siteBlk => {
                let siteHasMatch = false;
                siteBlk.querySelectorAll('.type-section').forEach(typeSec => {
                    let typeHasMatch = false;
                    typeSec.querySelectorAll('tr[data-status]').forEach(row => {
                        const extText = row.innerText ? row.innerText.toLowerCase() : '';
                        const matchesQuery = extText.includes(query);
                        row.style.display = matchesQuery ? 'table-row' : 'none';
                        if (matchesQuery) { typeHasMatch = true; siteHasMatch = true; userHasMatch = true; }
                    });
                    typeSec.style.display = typeHasMatch ? 'block' : 'none';
                    if (typeHasMatch) toggleBlockView(typeSec.querySelector('.type-trigger'), typeSec.querySelector('.type-content'), true);
                });
                siteBlk.style.display = siteHasMatch ? 'block' : 'none';
                if (siteHasMatch) toggleBlockView(siteBlk.querySelector('.site-trigger'), siteBlk.querySelector('.site-content'), true);
            });
            userSec.style.display = userHasMatch ? 'block' : 'none';
            if (userHasMatch) toggleBlockView(userSec.querySelector('.user-trigger'), userSec.querySelector('.user-content'), true);
        });
    });
EOF

# ==============================================================================
# Step 17: AI-powered mathematical computation engine (pop-up), document footer, and terminal final report.
# ==============================================================================
# --- HTML Report Generation: Step 17 (AI Telemetry & Final Script Closures) ---

cat << 'EOF' >> "$HTML_FILE"
    // AI Telemetry Audit Engine
    document.getElementById('run-ai-check').addEventListener('click', function() {
        let totalExtensions = 0, outdatedExtensions = 0, unknownFeeds = 0, totalSites = reportData.websites.length, eolSites = 0;

        reportData.websites.forEach(site => {
            if (parseInt(site.core_version.split('.')) <= 3) eolSites++;
            if (site.extensions) {
                site.extensions.forEach(ext => {
                    totalExtensions++;
                    const status = String(ext.latest_version).toLowerCase();
                    if (status.includes('feed') || status.includes('error') || status.includes('unreachable') || status.includes('unknown')) unknownFeeds++;
                    else if (ext.version.trim() !== ext.latest_version.trim() && /^[0-9]/.test(ext.latest_version)) outdatedExtensions++;
                });
            }
        });

        let healthScore = 100 - ((outdatedExtensions * 4) + (eolSites * 15));
        healthScore = Math.max(0, Math.min(100, healthScore));
        let errorRate = totalExtensions > 0 ? Math.round((unknownFeeds / totalExtensions) * 100) : 0;

        document.getElementById('ai-score').innerText = healthScore + "%";
        document.getElementById('ai-score').className = healthScore >= 75 ? "metric-val val-secure" : "metric-val val-danger";
        document.getElementById('ai-error-rate').innerText = errorRate + "%";

        let verdict = `<strong>AI Security Assessment Summary:</strong><br><br>Analyzed <strong>${totalSites}</strong> sites running <strong>${totalExtensions}</strong> packages.<br><br>`;
        if (outdatedExtensions > 0 || eolSites > 0) verdict += `⚠️ <strong>Alert:</strong> Found <strong>${outdatedExtensions}</strong> outdated packages and <strong>${eolSites}</strong> EOL kernels.<br><br>`;
        else verdict += `✓ <strong>Excellence:</strong> All packages appear solid.<br><br>`;
        verdict += `📊 <strong>Data Realism Metric:</strong> Estimated data error rate is <strong>${errorRate}%</strong> (${unknownFeeds} endpoints unreachable or protected).`;

        document.getElementById('ai-verdict-text').innerHTML = verdict;
        document.getElementById('ai-modal').style.display = 'flex';
    });

    document.getElementById('close-ai-modal').addEventListener('click', () => { document.getElementById('ai-modal').style.display = 'none'; });
    renderDashboardTree();
</script>
    <footer>
        System automated reporting architecture developed by <a href="https://github.com/MahdiAhazan/Joomla-Scanner" target="_blank">MAHDI AHAZAN</a>. Code released via GitHub repository.
    </footer>
</div>
</body>
</html>
EOF

# Calculate operational profiling times
END_TIME=$(date +%s)
ELAPSED_TIME=$((END_TIME - START_TIME))

echo "=============================================================================="
echo -e "\e[32m[✓]\e[0m Processing Execution Completed successfully!"
echo -e "\e[34m[+]\e[0m Raw JSON Report Saved:    $JSON_FILE"
echo -e "\e[34m[+]\e[0m Visual HTML Dashboard:    $HTML_FILE"
echo -e "\e[34m[+]\e[0m Text Directory Files:     $REPORT_DIR"
echo -e "\e[32m[✓]\e[0m Elapsed execution time:   $ELAPSED_TIME seconds."
echo "=============================================================================="
