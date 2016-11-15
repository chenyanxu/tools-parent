package cn.com.rexen.kalix.tools.webconsole.servlet;

import org.codehaus.jackson.map.ObjectMapper;
import org.osgi.framework.*;
import org.osgi.service.packageadmin.ExportedPackage;
import org.osgi.service.packageadmin.PackageAdmin;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

@SuppressWarnings("serial")
public class BundlesServlet extends HttpServlet {

    private BundleContext bundleContext;

    public BundlesServlet(BundleContext bundleContext) {
        this.bundleContext = bundleContext;
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        Bundle[] bundles = bundleContext.getBundles();
        JsonBundles jsonBundles = new JsonBundles(bundles);
        ObjectMapper om = new ObjectMapper();
        om.writeValue(resp.getWriter(), jsonBundles);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        Long bundleId = Long.valueOf(req.getParameter("bundleId"));

        Bundle bundle = bundleContext.getBundle(bundleId);
        try {
            if ("stop".equals(action)) {
                bundle.stop();
            } else if ("start".equals(action)) {
                bundle.start();
            } else if ("uninstall".equals(action)) {
                bundle.uninstall();
            } else {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Unknown action: " + action);
            }
            resp.setContentType("application/json");
            resp.getWriter().print("{success : true}");
        } catch (BundleException e) {
            log(String.format("Error while executing action [%s]", action), e);
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    ;

    PackageAdmin getPackageAdmin() {
        ServiceReference ref = bundleContext.getServiceReference(PackageAdmin.class.getName());
        if (ref != null) {
            return (PackageAdmin) bundleContext.getService(ref);
        }
        return null;
    }

    class JsonBundles {
        Bundle[] bundles;

        JsonBundles(Bundle[] bundles) {
            this.bundles = bundles;
        }

        public List<JsonBundleDetails> getBundles() {
            List<JsonBundleDetails> jsonBundles = new ArrayList<JsonBundleDetails>();
            if (bundles != null) {
                for (Bundle bundle : bundles) {
                    jsonBundles.add(new JsonBundleDetails(bundle));
                }
            }
            return jsonBundles;
        }
    }

    class JsonBundleDetails {
        Bundle bundle;

        JsonBundleDetails(Bundle bundle) {
            this.bundle = bundle;
        }

        public Long getId() {
            return bundle.getBundleId();
        }

        public String getSymbolicName() {
            return bundle.getSymbolicName();
        }

        @Deprecated
        public String getName() {
            Dictionary manifestHeaders = bundle.getHeaders();
            return String.format("%s (%s)",
                    manifestHeaders.get(Constants.BUNDLE_NAME),
                    bundle.getSymbolicName());
        }

        public String getDescription() {
            return (String) bundle.getHeaders().get(Constants.BUNDLE_DESCRIPTION);
        }

        public String getVersion() {
            return bundle.getVersion().toString();
        }

        public String getCategory() {
            Dictionary manifestHeaders = bundle.getHeaders();
            return (String) manifestHeaders.get(Constants.BUNDLE_CATEGORY);
        }

        public String getLocation() {
            return bundle.getLocation();
        }

        public Date getLastModified() {
            return new Date(bundle.getLastModified());
        }

        public Collection<JsonService> getServices() {
            ServiceReference[] serviceReferences = bundle.getRegisteredServices();
            if (serviceReferences != null) {
                List<JsonService> jsonServices = new ArrayList<JsonService>();
                for (ServiceReference sr : serviceReferences) {
                    jsonServices.add(new JsonService(sr));
                }
                return jsonServices;
            } else {
                return Collections.emptyList();
            }
        }

        public Collection<JsonHeader> getManifestHeaders() {
            List<JsonHeader> headers = new ArrayList<JsonHeader>();
            Enumeration<String> keys = bundle.getHeaders().keys();
            while (keys.hasMoreElements()) {
                String key = keys.nextElement();
                headers.add(new JsonHeader(key, String.valueOf(bundle.getHeaders().get(key))));
            }
            return headers;
        }

        public Collection<JsonPackage> getExportedPackages() {
            PackageAdmin packageAdmin = getPackageAdmin();
            if (packageAdmin != null) {
                ExportedPackage[] exportedPackages = packageAdmin.getExportedPackages(bundle);
                if (exportedPackages != null) {
                    List<JsonPackage> jsonPackages = new ArrayList<JsonPackage>(exportedPackages.length);
                    for (ExportedPackage ep : exportedPackages) {
                        jsonPackages.add(new JsonPackage(ep.getName(), String.valueOf(ep.getVersion())));
                    }
                    return jsonPackages;
                } else {
                    return Collections.emptyList();
                }
            } else {
                // TODO IS IT A GOOD INDICATION THAT THE PACKAGEADMIN SERVICE IS NOT AVAILABLE?
                return null;
            }
        }

        public Collection<JsonPackage> getImportedPackages() {
            PackageAdmin packageAdmin = getPackageAdmin();
            if (packageAdmin != null) {
                ExportedPackage[] exportedPackages = packageAdmin.getExportedPackages((Bundle) null);
                if (exportedPackages != null) {
                    List<JsonPackage> jsonPackages = new ArrayList<JsonPackage>();
                    for (ExportedPackage ep : exportedPackages) {
                        Bundle[] importinBundles = ep.getImportingBundles();
                        for (Bundle importingBundle : importinBundles) {
                            if (importingBundle.getBundleId() == bundle.getBundleId()) {
                                jsonPackages.add(new JsonImportedPackage(ep.getName(), String.valueOf(ep.getVersion()), ep.getExportingBundle()));
                            }
                        }
                    }
                    return jsonPackages;
                } else {
                    return Collections.emptyList();
                }
            } else {
                // TODO CHECK IF IS IT A GOOD INDICATION THAT THE PACKAGEADMIN SERVICE IS NOT AVAILABLE?
                return null;
            }
        }

        public Collection<JsonBundle> getImportingBundles() {
            PackageAdmin packageAdmin = getPackageAdmin();
            if (packageAdmin != null) {
                ExportedPackage[] exportedPackages = packageAdmin.getExportedPackages(bundle);
                Map<Long, JsonBundle> importingBundlesMap = new HashMap<Long, JsonBundle>();
                if (exportedPackages != null) {
                    for (ExportedPackage ep : exportedPackages) {
                        Bundle[] importingBundles = ep.getImportingBundles();
                        for (Bundle b : importingBundles) {
                            if (!importingBundlesMap.containsKey(b.getBundleId())) {
                                importingBundlesMap.put(b.getBundleId(), new JsonBundle(b));
                            }
                        }
                    }
                }
                return importingBundlesMap.values();
            } else {
                // TODO CHECK IF IS IT A GOOD INDICATION THAT THE PACKAGEADMIN SERVICE IS NOT AVAILABLE?
                return null;
            }
        }

        public String getState() {
            switch (bundle.getState()) {
                case Bundle.UNINSTALLED:
                    return "Uninstalled";
                case Bundle.INSTALLED:
                    return "Installed";
                case Bundle.RESOLVED:
                    return "Resolved";
                case Bundle.STARTING:
                    return "Starting";
                case Bundle.STOPPING:
                    return "Stopping";
                case Bundle.ACTIVE:
                    return "Active";
                default:
                    return null;
            }
        }
    }

    class JsonHeader {
        String key;
        String value;

        JsonHeader(String key, String value) {
            this.key = key;
            this.value = value;
        }

        public String getKey() {
            return key;
        }

        public String getValue() {
            return value;
        }
    }

    class JsonPackage {
        String name;
        String version;

        JsonPackage(String name, String version) {
            this.name = name;
            this.version = version;
        }

        public String getName() {
            return name;
        }

        public String getVersion() {
            return version;
        }
    }

    class JsonImportedPackage extends JsonPackage {
        Bundle exportingBundle;

        public JsonImportedPackage(String name, String version, Bundle exportingBundle) {
            super(name, version);
            this.exportingBundle = exportingBundle;
        }

        public JsonBundle getExportingBundle() {
            return new JsonBundle(exportingBundle);
        }

    }

    class JsonBundle {
        Bundle bundle;

        JsonBundle(Bundle bundle) {
            this.bundle = bundle;
        }

        public String getSymbolicName() {
            return bundle.getSymbolicName();
        }

        public Long getId() {
            return bundle.getBundleId();
        }
    }

    class JsonService {
        ServiceReference serviceReference;

        public JsonService(ServiceReference serviceReference) {
            this.serviceReference = serviceReference;
        }

        public Long getId() {
            return (Long) serviceReference.getProperty(Constants.SERVICE_ID);
        }

        public Collection<String> getTypes() {
            String[] types = (String[]) serviceReference.getProperty(Constants.OBJECTCLASS);
            return Arrays.asList(types);
        }
    }

}
