<?php

use Symfony\Component\HttpKernel\Kernel;
use Symfony\Component\Config\Loader\LoaderInterface;

class AppKernel extends Kernel
{
    public function registerBundles()
    {
        $bundles = array(
            new Symfony\Bundle\FrameworkBundle\FrameworkBundle(),
            new Symfony\Bundle\SecurityBundle\SecurityBundle(),
            new Symfony\Bundle\TwigBundle\TwigBundle(),
            new Symfony\Bundle\MonologBundle\MonologBundle(),
            new Symfony\Bundle\SwiftmailerBundle\SwiftmailerBundle(),
            new Symfony\Bundle\AsseticBundle\AsseticBundle(),
		    new Symfony\Cmf\Bundle\RoutingBundle\CmfRoutingBundle(),
            new Doctrine\Bundle\DoctrineBundle\DoctrineBundle(),
            new Sensio\Bundle\FrameworkExtraBundle\SensioFrameworkExtraBundle(),
            new Resto\BarreBundle\RestoBarreBundle(),
			new FOS\UserBundle\FOSUserBundle(),
			new Application\Sonata\MediaBundle\ApplicationSonataMediaBundle(),
			new Application\Sonata\ClassificationBundle\ApplicationSonataClassificationBundle(),
			new Application\Sonata\NewsBundle\ApplicationSonataNewsBundle(),
			new Application\Sonata\UserBundle\ApplicationSonataUserBundle(),
			new Application\Sonata\PageBundle\ApplicationSonataPageBundle(),
			new Application\Sonata\NotificationBundle\ApplicationSonataNotificationBundle(),
			new Sonata\EasyExtendsBundle\SonataEasyExtendsBundle(),
            new Sonata\BlockBundle\SonataBlockBundle(),
            new Sonata\jQueryBundle\SonatajQueryBundle(),
            new Knp\Bundle\MenuBundle\KnpMenuBundle(),
			new Knp\Bundle\MarkdownBundle\KnpMarkdownBundle(),
            new Sonata\DoctrineORMAdminBundle\SonataDoctrineORMAdminBundle(),
            new Sonata\AdminBundle\SonataAdminBundle(),
			new Sonata\NewsBundle\SonataNewsBundle(),
			new Sonata\ClassificationBundle\SonataClassificationBundle(),
			new Sonata\UserBundle\SonataUserBundle('FOSUserBundle'),
			new Sonata\MediaBundle\SonataMediaBundle(),	
			new Ivory\CKEditorBundle\IvoryCKEditorBundle(),	
			new Sonata\IntlBundle\SonataIntlBundle(),	
			new Sonata\MarkItUpBundle\SonataMarkItUpBundle(),
			new Sonata\FormatterBundle\SonataFormatterBundle(),
			new Sonata\PageBundle\SonataPageBundle(),
			new Sonata\SeoBundle\SonataSeoBundle(),
			new Sonata\CacheBundle\SonataCacheBundle(),
			new Sonata\NotificationBundle\SonataNotificationBundle(),



        );

        if (in_array($this->getEnvironment(), array('dev', 'test'))) {
            $bundles[] = new Acme\DemoBundle\AcmeDemoBundle();
            $bundles[] = new Symfony\Bundle\WebProfilerBundle\WebProfilerBundle();
            $bundles[] = new Sensio\Bundle\DistributionBundle\SensioDistributionBundle();
            $bundles[] = new Sensio\Bundle\GeneratorBundle\SensioGeneratorBundle();
        }

        return $bundles;
    }

    public function registerContainerConfiguration(LoaderInterface $loader)
    {
        $loader->load(__DIR__.'/config/config_'.$this->getEnvironment().'.yml');
    }
}