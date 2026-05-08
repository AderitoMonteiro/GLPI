<?php

use Twig\Environment;
use Twig\Error\LoaderError;
use Twig\Error\RuntimeError;
use Twig\Extension\CoreExtension;
use Twig\Extension\SandboxExtension;
use Twig\Markup;
use Twig\Sandbox\SecurityError;
use Twig\Sandbox\SecurityNotAllowedTagError;
use Twig\Sandbox\SecurityNotAllowedFilterError;
use Twig\Sandbox\SecurityNotAllowedFunctionError;
use Twig\Source;
use Twig\Template;

/* pages/management/contract.html.twig */
class __TwigTemplate_2b39b5a35e0ad9439d232af2a6d17b04 extends Template
{
    private $source;
    private $macros = [];

    public function __construct(Environment $env)
    {
        parent::__construct($env);

        $this->source = $this->getSourceContext();

        $this->blocks = [
            'more_fields' => [$this, 'block_more_fields'],
        ];
    }

    protected function doGetParent(array $context)
    {
        // line 34
        return "generic_show_form.html.twig";
    }

    protected function doDisplay(array $context, array $blocks = [])
    {
        $macros = $this->macros;
        // line 35
        $macros["fields"] = $this->macros["fields"] = $this->loadTemplate("components/form/fields_macros.html.twig", "pages/management/contract.html.twig", 35)->unwrap();
        // line 36
        $context["params"] = (($context["params"]) ?? ([]));
        // line 34
        $this->parent = $this->loadTemplate("generic_show_form.html.twig", "pages/management/contract.html.twig", 34);
        yield from $this->parent->unwrap()->yield($context, array_merge($this->blocks, $blocks));
    }

    // line 38
    public function block_more_fields($context, array $blocks = [])
    {
        $macros = $this->macros;
        // line 39
        yield "   ";
        yield CoreExtension::callMacro($macros["fields"], "macro_autoNameField", ["num",         // line 41
($context["item"] ?? null), _x("phone", "Number"),         // line 43
($context["withtemplate"] ?? null)], 39, $context, $this->getSourceContext());
        // line 44
        yield "

   ";
        // line 46
        if (( !Twig\Extension\CoreExtension::testEmpty((($__internal_compile_0 = CoreExtension::getAttribute($this->env, $this->source, ($context["item"] ?? null), "fields", [], "any", false, false, false, 46)) && is_array($__internal_compile_0) || $__internal_compile_0 instanceof ArrayAccess ? ($__internal_compile_0["begin_date"] ?? null) : null)) &&  !Twig\Extension\CoreExtension::testEmpty((($__internal_compile_1 = CoreExtension::getAttribute($this->env, $this->source, ($context["item"] ?? null), "fields", [], "any", false, false, false, 46)) && is_array($__internal_compile_1) || $__internal_compile_1 instanceof ArrayAccess ? ($__internal_compile_1["duration"] ?? null) : null)))) {
            // line 47
            yield "      ";
            $context["end_title"] = __("End date");
            // line 48
            yield "      ";
            if (((($__internal_compile_2 = CoreExtension::getAttribute($this->env, $this->source, ($context["item"] ?? null), "fields", [], "any", false, false, false, 48)) && is_array($__internal_compile_2) || $__internal_compile_2 instanceof ArrayAccess ? ($__internal_compile_2["renewal"] ?? null) : null) == Twig\Extension\CoreExtension::constant("Contract::RENEWAL_TACIT"))) {
                // line 49
                yield "         ";
                $context["end_title"] = __("Next renewal date");
                // line 50
                yield "      ";
            }
            // line 51
            yield "      ";
            $context["warranty_expiration"] = ('' === $tmp = \Twig\Extension\CoreExtension::captureOutput((function () use (&$context, $macros, $blocks) {
                // line 52
                yield "         <span title=\"";
                yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(((array_key_exists("end_title", $context)) ? (Twig\Extension\CoreExtension::default(($context["end_title"] ?? null), "")) : ("")), "html", null, true);
                yield "\" data-bs-toggle=\"tooltip\">
            <i class=\"fas fa-arrow-right\"></i>
            ";
                // line 54
                yield $this->extensions['Glpi\Application\View\Extension\PhpExtension']->call("Infocom::getWarrantyExpir", [(($__internal_compile_3 = CoreExtension::getAttribute($this->env, $this->source,                 // line 55
($context["item"] ?? null), "fields", [], "any", false, false, false, 55)) && is_array($__internal_compile_3) || $__internal_compile_3 instanceof ArrayAccess ? ($__internal_compile_3["begin_date"] ?? null) : null), (($__internal_compile_4 = CoreExtension::getAttribute($this->env, $this->source,                 // line 56
($context["item"] ?? null), "fields", [], "any", false, false, false, 56)) && is_array($__internal_compile_4) || $__internal_compile_4 instanceof ArrayAccess ? ($__internal_compile_4["duration"] ?? null) : null), 0, true, ((($__internal_compile_5 = CoreExtension::getAttribute($this->env, $this->source,                 // line 59
($context["item"] ?? null), "fields", [], "any", false, false, false, 59)) && is_array($__internal_compile_5) || $__internal_compile_5 instanceof ArrayAccess ? ($__internal_compile_5["renewal"] ?? null) : null) == Twig\Extension\CoreExtension::constant("Contract::RENEWAL_TACIT")), (($__internal_compile_6 = CoreExtension::getAttribute($this->env, $this->source,                 // line 60
($context["item"] ?? null), "fields", [], "any", false, false, false, 60)) && is_array($__internal_compile_6) || $__internal_compile_6 instanceof ArrayAccess ? ($__internal_compile_6["periodicity"] ?? null) : null)]);
                // line 61
                yield "
         </span>
      ";
                return; yield '';
            })())) ? '' : new Markup($tmp, $this->env->getCharset());
            // line 64
            yield "   ";
        }
        // line 65
        yield "   ";
        yield CoreExtension::callMacro($macros["fields"], "macro_dropdownNumberField", ["duration", (($__internal_compile_7 = CoreExtension::getAttribute($this->env, $this->source, ($context["item"] ?? null), "fields", [], "any", false, false, false, 65)) && is_array($__internal_compile_7) || $__internal_compile_7 instanceof ArrayAccess ? ($__internal_compile_7["duration"] ?? null) : null), __("Initial contract period"), ["rand" =>         // line 66
($context["rand"] ?? null), "min" => 1, "max" => 120, "step" => 1, "toadd" => [Twig\Extension\CoreExtension::constant("Dropdown::EMPTY_VALUE")], "unit" => "month", "add_field_html" => ((        // line 72
array_key_exists("warranty_expiration", $context)) ? (Twig\Extension\CoreExtension::default(($context["warranty_expiration"] ?? null), "")) : (""))]], 65, $context, $this->getSourceContext());
        // line 73
        yield "

   ";
        // line 75
        if ((( !Twig\Extension\CoreExtension::testEmpty((($__internal_compile_8 = CoreExtension::getAttribute($this->env, $this->source, ($context["item"] ?? null), "fields", [], "any", false, false, false, 75)) && is_array($__internal_compile_8) || $__internal_compile_8 instanceof ArrayAccess ? ($__internal_compile_8["begin_date"] ?? null) : null)) && ((($__internal_compile_9 = CoreExtension::getAttribute($this->env, $this->source, ($context["item"] ?? null), "fields", [], "any", false, false, false, 75)) && is_array($__internal_compile_9) || $__internal_compile_9 instanceof ArrayAccess ? ($__internal_compile_9["notice"] ?? null) : null) > 0)) &&  !Twig\Extension\CoreExtension::testEmpty((($__internal_compile_10 = CoreExtension::getAttribute($this->env, $this->source, ($context["item"] ?? null), "fields", [], "any", false, false, false, 75)) && is_array($__internal_compile_10) || $__internal_compile_10 instanceof ArrayAccess ? ($__internal_compile_10["duration"] ?? null) : null)))) {
            // line 76
            yield "      ";
            $context["notice_info"] = ('' === $tmp = \Twig\Extension\CoreExtension::captureOutput((function () use (&$context, $macros, $blocks) {
                // line 77
                yield "         <i class=\"fas fa-arrow-right\"></i>
         ";
                // line 78
                yield $this->extensions['Glpi\Application\View\Extension\PhpExtension']->call("Infocom::getWarrantyExpir", [(($__internal_compile_11 = CoreExtension::getAttribute($this->env, $this->source,                 // line 79
($context["item"] ?? null), "fields", [], "any", false, false, false, 79)) && is_array($__internal_compile_11) || $__internal_compile_11 instanceof ArrayAccess ? ($__internal_compile_11["begin_date"] ?? null) : null), (($__internal_compile_12 = CoreExtension::getAttribute($this->env, $this->source,                 // line 80
($context["item"] ?? null), "fields", [], "any", false, false, false, 80)) && is_array($__internal_compile_12) || $__internal_compile_12 instanceof ArrayAccess ? ($__internal_compile_12["duration"] ?? null) : null), (($__internal_compile_13 = CoreExtension::getAttribute($this->env, $this->source,                 // line 81
($context["item"] ?? null), "fields", [], "any", false, false, false, 81)) && is_array($__internal_compile_13) || $__internal_compile_13 instanceof ArrayAccess ? ($__internal_compile_13["notice"] ?? null) : null), true, ((($__internal_compile_14 = CoreExtension::getAttribute($this->env, $this->source,                 // line 83
($context["item"] ?? null), "fields", [], "any", false, false, false, 83)) && is_array($__internal_compile_14) || $__internal_compile_14 instanceof ArrayAccess ? ($__internal_compile_14["renewal"] ?? null) : null) == Twig\Extension\CoreExtension::constant("Contract::RENEWAL_TACIT")), (($__internal_compile_15 = CoreExtension::getAttribute($this->env, $this->source,                 // line 84
($context["item"] ?? null), "fields", [], "any", false, false, false, 84)) && is_array($__internal_compile_15) || $__internal_compile_15 instanceof ArrayAccess ? ($__internal_compile_15["periodicity"] ?? null) : null)]);
                // line 85
                yield "
      ";
                return; yield '';
            })())) ? '' : new Markup($tmp, $this->env->getCharset());
            // line 87
            yield "   ";
        }
        // line 88
        yield "   ";
        yield CoreExtension::callMacro($macros["fields"], "macro_dropdownNumberField", ["notice", (($__internal_compile_16 = CoreExtension::getAttribute($this->env, $this->source, ($context["item"] ?? null), "fields", [], "any", false, false, false, 88)) && is_array($__internal_compile_16) || $__internal_compile_16 instanceof ArrayAccess ? ($__internal_compile_16["notice"] ?? null) : null), __("Notice"), ["rand" =>         // line 89
($context["rand"] ?? null), "min" => 0, "max" => 120, "step" => 1, "unit" => "month", "add_field_html" => ((        // line 94
array_key_exists("notice_info", $context)) ? (Twig\Extension\CoreExtension::default(($context["notice_info"] ?? null), "")) : (""))]], 88, $context, $this->getSourceContext());
        // line 95
        yield "

   ";
        // line 97
        yield CoreExtension::callMacro($macros["fields"], "macro_autoNameField", ["accounting_number",         // line 99
($context["item"] ?? null), __("Account number"),         // line 101
($context["withtemplate"] ?? null)], 97, $context, $this->getSourceContext());
        // line 102
        yield "

   ";
        // line 104
        yield CoreExtension::callMacro($macros["fields"], "macro_dropdownNumberField", ["periodicity", (($__internal_compile_17 = CoreExtension::getAttribute($this->env, $this->source, ($context["item"] ?? null), "fields", [], "any", false, false, false, 104)) && is_array($__internal_compile_17) || $__internal_compile_17 instanceof ArrayAccess ? ($__internal_compile_17["periodicity"] ?? null) : null), __("Contract renewal period"), ["rand" =>         // line 105
($context["rand"] ?? null), "min" => 12, "max" => 60, "step" => 12, "toadd" => [Twig\Extension\CoreExtension::constant("Dropdown::EMPTY_VALUE"), Twig\Extension\CoreExtension::sprintf(_n("%d month", "%d months", 1), 1), Twig\Extension\CoreExtension::sprintf(_n("%d month", "%d months", 2), 2), Twig\Extension\CoreExtension::sprintf(_n("%d month", "%d months", 3), 3), 6 => Twig\Extension\CoreExtension::sprintf(_n("%d month", "%d months", 6), 6)], "unit" => "month"]], 104, $context, $this->getSourceContext());
        // line 117
        yield "

   ";
        // line 119
        yield CoreExtension::callMacro($macros["fields"], "macro_dropdownNumberField", ["billing", (($__internal_compile_18 = CoreExtension::getAttribute($this->env, $this->source, ($context["item"] ?? null), "fields", [], "any", false, false, false, 119)) && is_array($__internal_compile_18) || $__internal_compile_18 instanceof ArrayAccess ? ($__internal_compile_18["billing"] ?? null) : null), __("Invoice period"), ["rand" =>         // line 120
($context["rand"] ?? null), "min" => 12, "max" => 60, "step" => 12, "toadd" => [Twig\Extension\CoreExtension::constant("Dropdown::EMPTY_VALUE"), Twig\Extension\CoreExtension::sprintf(_n("%d month", "%d months", 1), 1), Twig\Extension\CoreExtension::sprintf(_n("%d month", "%d months", 2), 2), Twig\Extension\CoreExtension::sprintf(_n("%d month", "%d months", 3), 3), 6 => Twig\Extension\CoreExtension::sprintf(_n("%d month", "%d months", 6), 6)], "unit" => "month"]], 119, $context, $this->getSourceContext());
        // line 132
        yield "

   ";
        // line 134
        yield CoreExtension::callMacro($macros["fields"], "macro_dropdownArrayField", ["renewal", (($__internal_compile_19 = CoreExtension::getAttribute($this->env, $this->source, ($context["item"] ?? null), "fields", [], "any", false, false, false, 134)) && is_array($__internal_compile_19) || $__internal_compile_19 instanceof ArrayAccess ? ($__internal_compile_19["renewal"] ?? null) : null), [Twig\Extension\CoreExtension::constant("Contract::RENEWAL_NEVER") => __("Never"), Twig\Extension\CoreExtension::constant("Contract::RENEWAL_TACIT") => __("Tacit"), Twig\Extension\CoreExtension::constant("Contract::RENEWAL_EXPRESS") => __("Express")], __("Renewal")], 134, $context, $this->getSourceContext());
        // line 138
        yield "

   ";
        // line 140
        yield CoreExtension::callMacro($macros["fields"], "macro_dropdownNumberField", ["max_links_allowed", (($__internal_compile_20 = CoreExtension::getAttribute($this->env, $this->source, ($context["item"] ?? null), "fields", [], "any", false, false, false, 140)) && is_array($__internal_compile_20) || $__internal_compile_20 instanceof ArrayAccess ? ($__internal_compile_20["max_links_allowed"] ?? null) : null), __("Max number of items"), ["min" => 1, "max" => 200000, "step" => 1, "toadd" => [__("Unlimited")]]], 140, $context, $this->getSourceContext());
        // line 145
        yield "

   ";
        // line 147
        $context["alert_html"] = ('' === $tmp = \Twig\Extension\CoreExtension::captureOutput((function () use (&$context, $macros, $blocks) {
            // line 148
            yield "      ";
            $this->extensions['Glpi\Application\View\Extension\PhpExtension']->call("Alert::displayLastAlert", ["Contract", (($__internal_compile_21 = CoreExtension::getAttribute($this->env, $this->source, ($context["item"] ?? null), "fields", [], "any", false, false, false, 148)) && is_array($__internal_compile_21) || $__internal_compile_21 instanceof ArrayAccess ? ($__internal_compile_21["id"] ?? null) : null)]);
            // line 149
            yield "   ";
            return; yield '';
        })())) ? '' : new Markup($tmp, $this->env->getCharset());
        // line 150
        yield "   ";
        yield CoreExtension::callMacro($macros["fields"], "macro_dropdownArrayField", ["alert", (($__internal_compile_22 = CoreExtension::getAttribute($this->env, $this->source, ($context["item"] ?? null), "fields", [], "any", false, false, false, 150)) && is_array($__internal_compile_22) || $__internal_compile_22 instanceof ArrayAccess ? ($__internal_compile_22["alert"] ?? null) : null), CoreExtension::getAttribute($this->env, $this->source, ($context["item"] ?? null), "getAlertName", [], "method", false, false, false, 150), __("Email alarms"), ["add_field_html" => (("<span class=\"text-muted\">" .         // line 151
($context["alert_html"] ?? null)) . "</span>")]], 150, $context, $this->getSourceContext());
        // line 152
        yield "
";
        return; yield '';
    }

    /**
     * @codeCoverageIgnore
     */
    public function getTemplateName()
    {
        return "pages/management/contract.html.twig";
    }

    /**
     * @codeCoverageIgnore
     */
    public function isTraitable()
    {
        return false;
    }

    /**
     * @codeCoverageIgnore
     */
    public function getDebugInfo()
    {
        return array (  191 => 152,  189 => 151,  187 => 150,  183 => 149,  180 => 148,  178 => 147,  174 => 145,  172 => 140,  168 => 138,  166 => 134,  162 => 132,  160 => 120,  159 => 119,  155 => 117,  153 => 105,  152 => 104,  148 => 102,  146 => 101,  145 => 99,  144 => 97,  140 => 95,  138 => 94,  137 => 89,  135 => 88,  132 => 87,  127 => 85,  125 => 84,  124 => 83,  123 => 81,  122 => 80,  121 => 79,  120 => 78,  117 => 77,  114 => 76,  112 => 75,  108 => 73,  106 => 72,  105 => 66,  103 => 65,  100 => 64,  94 => 61,  92 => 60,  91 => 59,  90 => 56,  89 => 55,  88 => 54,  82 => 52,  79 => 51,  76 => 50,  73 => 49,  70 => 48,  67 => 47,  65 => 46,  61 => 44,  59 => 43,  58 => 41,  56 => 39,  52 => 38,  47 => 34,  45 => 36,  43 => 35,  36 => 34,);
    }

    public function getSourceContext()
    {
        return new Source("", "pages/management/contract.html.twig", "/home/u981745852/domains/suporteincv.com/public_html/templates/pages/management/contract.html.twig");
    }
}
