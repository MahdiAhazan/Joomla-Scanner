# Universal Joomla Scanner & DevSecOps Audit Dashboard

An enterprise-grade, highly optimized Linux server-wide automated security auditing tool designed for Web Hosts, SysAdmins, and DevSecOps teams. It scans the entire file system, isolates Joomla CMS footprints, indexes custom 3rd-party components, and cross-references live update lifecycles utilizing a robust hybrid network/authenticated fallback architecture.

---

## 1. Initial Idea & Core System Capabilities
This system is architected to automate SecOps orchestration pipelines across shared hosting environments and cloud nodes (cPanel, Plesk, DirectAdmin). The tool performs lightning-fast disk crawling, isolates Joomla CMS kernels, and builds a centralized inventory of custom non-core components.
* **Isolation of Custom Extensions:** Dynamically filters out stock Joomla core components to deliver high-utility actionable datasets.
* **Visual Secure State Theming:** Profiles maintaining a 100% up-to-date framework infrastructure are colored in green and marked with an automated `✓ Secure` stamp badge.
* **Local AI Telemetry Assistant:** Computes overall server health ratings, computes data realism metrics based on unreachable endpoints, and outputs interactive analytics modals inside browser contexts.

---

## 2. Audit Details & Inspection Search Models
To guarantee maximum data realism and data validation accuracy, the framework executes an advanced **Inverse Hybrid Lookup** verification layout:
* **Model 1: Live Internet Feeds (Priority 1 - Primary):** Extracts live update URLs from local XML manifests, appends the site's active Joomla version variables (`?jver=X.X.X`), and fetches live data online simulating a real Chrome browser.
* **Model 2: Offline Reference Database (Priority 2 - Backup Fallback):** If a premium vendor's API endpoint is hidden behind protected firewalls or subscription paywalls, the system instantly queries `/root/joomla_commercial_db.txt` to fetch offline data baselines.

---

## 3. Automated Ticketing & Client Alert Email Generator
Eliminates the tedious overhead of copying separate alerts for individual extensions. A unified action button labeled **Copy Site Alert Email** is embedded right inside each website's header banner:
* **Template Generation Logic:** Clicking this button triggers JavaScript to scan all nested out-of-date entries for that domain, compiling an enterprise-grade security ticket in standard English, complete with a clean Markdown matrix data table ready for clipboard dispatch.

---

## 4. Live Plaintext Search Box & Auto-Expand Filtering
Auditing hundreds of server accounts manually is highly inefficient. Therefore, interactive control triggers have been deployed within the header control bar:
* **Live Search Bar (AJAX-like Filtering):** A client-side input field utilizing resilient `row.innerText` matching logic. Typing an extension string fraction (e.g., `yootheme`) instantly isolates matching rows, expanding nested category trees across all users in real-time.
* **Vulnerability Filter with Auto-Expand:** Toggling the "Show Outdated Only" switch hides all secure green sites and automatically expands (**Auto-Expand**) flawed directories alongside their outdated table rows. Global Expand/Collapse All triggers are also deployed for mass configuration controls.

---

## 5. Dynamic Version Management & Customization via External Text DB
One of the most powerful paradigms engineered inside this application is the ability to manually append, edit, or delete extension records directly inside the external commercial reference database file (`/root/joomla_commercial_db.txt`) completely offline.

### Step-by-Step Database Modification Guide:
To inject a brand new premium component or modify existing baseline metrics to perform a tighter security audit check, fire up your preferred text editor:
```bash
nano /root/joomla_commercial_db.txt
```
Strictly follow the structural format layout rules defined below:
* **Line Syntax Formatting Rule:** `element_or_slug_name|joomla_major_version|target_latest_stable_release`
* **Example - Modifying an Existing Entry:** If LiteSpeed releases a new update indexed as 1.4.4, locate and update the respective line matching your active CMS generation:
  `lscache|6|1.4.4`
* **Example - Appending a Brand New Component:** To introduce a completely new premium extension suite (e.g. `com_myextension`) whose latest stable release for Joomla 5 is `2.1.0`, append this line to the bottom of the catalog:
  `myextension|5|2.1.0`

*Operational Note: Thanks to the advanced Step 7 Wildcard Ecosystem Matcher layer, introducing the base element slug string will automatically cover and capture all related nested sub-plugins and extension blocks (`plg_myextension_*`), synchronizing their target baselines seamlessly.*

---

## 6. Deployment & Execution Steps
To execute the automation framework on a Linux server node, follow these operational directives:
1. Save the source script blocks inside a shell script profile file (e.g., `joomla_scanner.sh`).
2. Grant executing permissions vectors:
   ```bash
   chmod +x joomla_scanner.sh
   ```
3. Execute under elevated root space context:
   ```bash
   ./joomla_scanner.sh
   ```

---

## 7. Pre-Requisites Prior to Re-Running Scans
The commercial reference upgrade catalog operates outside the main script source. Before executing a fresh server sweep or when refreshing index parameters, verify the following constraints:
* **Purging Obsolete Databases:** To force the tool to rebuild the commercial asset catalog with pristine default bounds, delete the old tracking file using:
   ```bash
   rm -f /root/joomla_commercial_db.txt
   ```
* **Temporary Directory Maintenance:** While text logging files stored inside `/tmp/` are separated using unique execution timestamps, periodic purging of `/tmp/joomla_reports_*` maps helps maintain optimum disk storage health.

---

## 8. Customizing Extensions & Ecosystem Wildcards (Parent Priority Guard)
Premium extension ecosystems are equipped with a structural **Parent Priority Guard** layer to prevent nested submodules from inheriting faulty version markers:
* **Associated Wildcard Ecosystems:** Seamlessly covers nested extensions belonging to complex suites like Fabrik (`plg_fabrik_*`), LiteSpeed Cache (`mod_lscache_purge`), Smart Slider 3 (`plg_nextend_*`), and YOOtheme Pro (`plg_fields_location`).
* **Cross-Extension Integrator Resolution (e.g. Hikashop):** Components like *Hikashop AcyMailing Plugin* contain the AcyMailing keyword but update under the Hikashop package lifecycle. The guard gives right-of-way priority to the root parent (Hikashop), blocking false update alert triggers.

---

## 9. Identifying Joomla CMS Generations & Future-Proof Scaling
* **Dynamic Core Detection:** The Linux crawler engine dynamically parses core variables from `Version.php` maps. It will adapt to upcoming releases like Joomla 7.x or 8.x natively without code modifications.
* **Future-Proof Guard:** Houses an advanced mathematical conditional block (`-gt 5`). If a site runs a future upcoming major release exceeding current database parameters, the script automatically scales to target the highest available standard catalog bounds (5 or 6), guaranteeing permanent execution stability.

---

## 10. Deprecated Structural Code Architecture (Cleanup Logic)
To maintain code cleanliness and protect future optimization sequences, the following legacy code components have been fully deprecated, removed, and **must not** be reintroduced:
* **The Legacy `sed` Component Stripper:** Older manifest name parsers utilizing faulty string masks such as `[:space覆]` caused JSON parsing token failures and blank page rendering crashes. These have been completely replaced by clean `tr -d '\r'` Linux pipelines.
* **The Fragile JS `row.cells` DOM Indexer:** Using cell object properties directly without target index constraints within the search engine triggered active **TypeErrors**, causing layout trees to crash. This layout has been completely deprecated in favour of native `row.innerText` streams.
