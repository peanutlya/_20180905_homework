package utils;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

@Component
public class ContextUtils implements ApplicationContextAware{
    /**
     * Spring容器上下文工具类，用于获取当前的Spring容器
     * 实现了接口ApplicationContextAware且该类被Spring管理
     *则会自动调用setApplicationContext方法获取Spring容器对象
     */

        public static ApplicationContext context;

        @Override
        public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
            context = applicationContext;
        }

        /**
         * 根据名称名称获得bean
         */
        public static Object getBean(String name){
            return context.getBean(name);
        }

        /**
         * 根据类型获得bean
         */
        public static <T> T getBean(Class<T> clazz){
            return context.getBean(clazz);
        }
}

