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

/* components/form/support_hours.html.twig */
class __TwigTemplate_7bd7445e70fb4a03fcc95cb666069a31 extends Template
{
    private $source;
    private $macros = [];

    public function __construct(Environment $env)
    {
        parent::__construct($env);

        $this->source = $this->getSourceContext();

        $this->parent = false;

        $this->blocks = [
        ];
    }

    protected function doDisplay(array $context, array $blocks = [])
    {
        $macros = $this->macros;
        // line 33
        yield "
";
        // line 34
        $macros["fields"] = $this->macros["fields"] = $this->loadTemplate("components/form/fields_macros.html.twig", "components/form/support_hours.html.twig", 34)->unwrap();
        // line 35
        yield "
<div class=\"row mx-n2\">
   ";
        // line 37
        yield CoreExtension::callMacro($macros["fields"], "macro_largeTitle", [__("Support hours"), "fas fa-business-time"], 37, $context, $this->getSourceContext());
        yield "
   ";
        // line 38
        yield CoreExtension::callMacro($macros["fields"], "macro_smallTitle", [__("On week")], 38, $context, $this->getSourceContext());
        yield "
   ";
        // line 39
        yield CoreExtension::callMacro($macros["fields"], "macro_nullField", [["field_class" => "col-12 col-sm-4"]], 39, $context, $this->getSourceContext());
        yield "
   ";
        // line 40
        yield CoreExtension::callMacro($macros["fields"], "macro_dropdownHoursField", ["week_begin_hour", (($__internal_compile_0 = CoreExtension::getAttribute($this->env, $this->source, ($context["item"] ?? null), "fields", [], "any", false, false, false, 40)) && is_array($__internal_compile_0) || $__internal_compile_0 instanceof ArrayAccess ? ($__internal_compile_0["week_begin_hour"] ?? null) : null), __("Start"), ["field_class" => "col-12 col-sm-4"]], 40, $context, $this->getSourceContext());
        yield "
   ";
        // line 41
        yield CoreExtension::callMacro($macros["fields"], "macro_dropdownHoursField", ["week_end_hour", (($__internal_compile_1 = CoreExtension::getAttribute($this->env, $this->source, ($context["item"] ?? null), "fields", [], "any", false, false, false, 41)) && is_array($__internal_compile_1) || $__internal_compile_1 instanceof ArrayAccess ? ($__internal_compile_1["week_end_hour"] ?? null) : null), __("End"), ["field_class" => "col-12 col-sm-4"]], 41, $context, $this->getSourceContext());
        yield "

   ";
        // line 43
        yield CoreExtension::callMacro($macros["fields"], "macro_smallTitle", [__("On Saturday")], 43, $context, $this->getSourceContext());
        yield "
   ";
        // line 44
        yield CoreExtension::callMacro($macros["fields"], "macro_dropdownYesNo", ["use_saturday", (($__internal_compile_2 = CoreExtension::getAttribute($this->env, $this->source, ($context["item"] ?? null), "fields", [], "any", false, false, false, 44)) && is_array($__internal_compile_2) || $__internal_compile_2 instanceof ArrayAccess ? ($__internal_compile_2["use_saturday"] ?? null) : null), __("Use Saturday"), ["field_class" => "col-12 col-sm-4"]], 44, $context, $this->getSourceContext());
        yield "
   ";
        // line 45
        yield CoreExtension::callMacro($macros["fields"], "macro_dropdownHoursField", ["saturday_begin_hour", (($__internal_compile_3 = CoreExtension::getAttribute($this->env, $this->source, ($context["item"] ?? null), "fields", [], "any", false, false, false, 45)) && is_array($__internal_compile_3) || $__internal_compile_3 instanceof ArrayAccess ? ($__internal_compile_3["saturday_begin_hour"] ?? null) : null), __("Start"), ["field_class" => "col-12 col-sm-4"]], 45, $context, $this->getSourceContext());
        yield "
   ";
        // line 46
        yield CoreExtension::callMacro($macros["fields"], "macro_dropdownHoursField", ["saturday_end_hour", (($__internal_compile_4 = CoreExtension::getAttribute($this->env, $this->source, ($context["item"] ?? null), "fields", [], "any", false, false, false, 46)) && is_array($__internal_compile_4) || $__internal_compile_4 instanceof ArrayAccess ? ($__internal_compile_4["saturday_end_hour"] ?? null) : null), __("End"), ["field_class" => "col-12 col-sm-4"]], 46, $context, $this->getSourceContext());
        yield "

   ";
        // line 48
        yield CoreExtension::callMacro($macros["fields"], "macro_smallTitle", [__("Sundays and holidays")], 48, $context, $this->getSourceContext());
        yield "
   ";
        // line 49
        yield CoreExtension::callMacro($macros["fields"], "macro_dropdownYesNo", ["use_sunday", (($__internal_compile_5 = CoreExtension::getAttribute($this->env, $this->source, ($context["item"] ?? null), "fields", [], "any", false, false, false, 49)) && is_array($__internal_compile_5) || $__internal_compile_5 instanceof ArrayAccess ? ($__internal_compile_5["use_sunday"] ?? null) : null), __("Use Sunday"), ["field_class" => "col-12 col-sm-4"]], 49, $context, $this->getSourceContext());
        yield "
   ";
        // line 50
        yield CoreExtension::callMacro($macros["fields"], "macro_dropdownHoursField", ["sunday_begin_hour", (($__internal_compile_6 = CoreExtension::getAttribute($this->env, $this->source, ($context["item"] ?? null), "fields", [], "any", false, false, false, 50)) && is_array($__internal_compile_6) || $__internal_compile_6 instanceof ArrayAccess ? ($__internal_compile_6["sunday_begin_hour"] ?? null) : null), __("Start"), ["field_class" => "col-12 col-sm-4"]], 50, $context, $this->getSourceContext());
        yield "
   ";
        // line 51
        yield CoreExtension::callMacro($macros["fields"], "macro_dropdownHoursField", ["sunday_end_hour", (($__internal_compile_7 = CoreExtension::getAttribute($this->env, $this->source, ($context["item"] ?? null), "fields", [], "any", false, false, false, 51)) && is_array($__internal_compile_7) || $__internal_compile_7 instanceof ArrayAccess ? ($__internal_compile_7["sunday_end_hour"] ?? null) : null), __("End"), ["field_class" => "col-12 col-sm-4"]], 51, $context, $this->getSourceContext());
        yield "
</div>
";
        return; yield '';
    }

    /**
     * @codeCoverageIgnore
     */
    public function getTemplateName()
    {
        return "components/form/support_hours.html.twig";
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
        return array (  97 => 51,  93 => 50,  89 => 49,  85 => 48,  80 => 46,  76 => 45,  72 => 44,  68 => 43,  63 => 41,  59 => 40,  55 => 39,  51 => 38,  47 => 37,  43 => 35,  41 => 34,  38 => 33,);
    }

    public function getSourceContext()
    {
        return new Source("", "components/form/support_hours.html.twig", "/home/u981745852/domains/suporteincv.com/public_html/templates/components/form/support_hours.html.twig");
    }
}
