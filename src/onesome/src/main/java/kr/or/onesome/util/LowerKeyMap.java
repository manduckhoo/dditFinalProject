package kr.or.onesome.util;

import org.apache.commons.collections4.map.ListOrderedMap;
import org.apache.commons.lang.StringUtils;

/**
 * key 값으로 받은 문자열을 소문자로 바꿔 사용하기 위한
 * Map 클래스
 */
public class LowerKeyMap extends ListOrderedMap {

    @Override
    public Object put(Object key, Object value) {
        return super.put(StringUtils.lowerCase((String)key),value);
    }
}
