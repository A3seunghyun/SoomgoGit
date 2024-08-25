package action;

import javax.servlet.http.HttpSession;

public class LoginSessionUtils {

    public static Integer getUserIdx(HttpSession session) {
        Integer userIdx = (Integer) session.getAttribute("L_users_idx");
        if (userIdx == null) {
            userIdx = 0;
        }
        return userIdx;
    }

    public static Integer getIsGosu(HttpSession session) {
        Integer isgosu = (Integer) session.getAttribute("isgosu");
        if (isgosu == null) {
            isgosu = 2;
        }
        return isgosu;
    }
}
