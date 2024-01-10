package kr.or.onesome.util;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class DateCalculater {

    /**
     * 입력한 날짜 기준으로 이전달을 반환하기 위한 메서드<br>
     * 날짜 패턴은 yyyy-MM
     * @param currentMonth yyyy-MM 패턴의 날짜 문자열
     * @return currentMonth의 이전달 문자열
     */
    public String getPreviousMonth(String currentMonth){
        LocalDate date = LocalDate.parse(currentMonth + "-01");
        LocalDate previousMonth = date.minusMonths(1);
        return previousMonth.format(DateTimeFormatter.ofPattern("yyyy-MM"));
    }

    /**
     * 입력한 날짜 기준으로 다음달을 반환하기 위한 메서드<br>
     * 날짜 패턴은 yyyy-MM
     * @param currentMonth yyyy-MM 패턴의 날짜 문자열
     * @return currentMonth의 다음달 문자열
     */
    public String getNextMonth(String currentMonth) {
        LocalDate date = LocalDate.parse(currentMonth + "-01");
        LocalDate nextMonth = date.plusMonths(1);
        return nextMonth.format(DateTimeFormatter.ofPattern("yyyy-MM"));
    }
}
