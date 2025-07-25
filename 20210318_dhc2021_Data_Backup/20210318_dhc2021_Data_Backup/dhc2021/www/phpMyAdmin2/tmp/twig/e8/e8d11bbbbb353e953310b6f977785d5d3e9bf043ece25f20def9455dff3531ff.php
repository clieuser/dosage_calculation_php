<?php

use Twig\Environment;
use Twig\Error\LoaderError;
use Twig\Error\RuntimeError;
use Twig\Markup;
use Twig\Sandbox\SecurityError;
use Twig\Sandbox\SecurityNotAllowedTagError;
use Twig\Sandbox\SecurityNotAllowedFilterError;
use Twig\Sandbox\SecurityNotAllowedFunctionError;
use Twig\Source;
use Twig\Template;

/* div_for_slider_effect.twig */
class __TwigTemplate_5b6bce87dd2c51c2e80d4b949699cfde8ae183cc0ba217f702cf77cf991ca763 extends \Twig\Template
{
    public function __construct(Environment $env)
    {
        parent::__construct($env);

        $this->parent = false;

        $this->blocks = [
        ];
    }

    protected function doDisplay(array $context, array $blocks = [])
    {
        // line 1
        if ((($context["initial_sliders_state"] ?? null) == "disabled")) {
            // line 2
            echo "    <div";
            if ((isset($context["id"]) || array_key_exists("id", $context))) {
                echo " id=\"";
                echo twig_escape_filter($this->env, ($context["id"] ?? null), "html", null, true);
                echo "\"";
            }
            echo ">
";
        } else {
            // line 4
            echo "    ";
            // line 12
            echo "    <div";
            if ((isset($context["id"]) || array_key_exists("id", $context))) {
                echo " id=\"";
                echo twig_escape_filter($this->env, ($context["id"] ?? null), "html", null, true);
                echo "\"";
            }
            // line 13
            echo " ";
            if ((($context["initial_sliders_state"] ?? null) == "closed")) {
                // line 14
                echo "style=\"display: none; overflow:auto;\"";
            }
            echo " class=\"pma_auto_slider\"";
            // line 15
            if ((isset($context["message"]) || array_key_exists("message", $context))) {
                echo " title=\"";
                echo twig_escape_filter($this->env, ($context["message"] ?? null), "html", null, true);
                echo "\"";
            }
            echo ">
";
        }
    }

    public function getTemplateName()
    {
        return "div_for_slider_effect.twig";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  58 => 15,  54 => 14,  51 => 13,  44 => 12,  42 => 4,  32 => 2,  30 => 1,);
    }

    /** @deprecated since 1.27 (to be removed in 2.0). Use getSourceContext() instead */
    public function getSource()
    {
        @trigger_error('The '.__METHOD__.' method is deprecated since version 1.27 and will be removed in 2.0. Use getSourceContext() instead.', E_USER_DEPRECATED);

        return $this->getSourceContext()->getCode();
    }

    public function getSourceContext()
    {
        return new Source("", "div_for_slider_effect.twig", "/dhc2021/www/phpMyAdmin2/templates/div_for_slider_effect.twig");
    }
}
