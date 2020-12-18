using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;

namespace WebApi.Helpers.Extension
{
    public static class ExtensionString
    {
        private static RNGCryptoServiceProvider provider = new RNGCryptoServiceProvider();
        private static Random ram = new Random(DateTime.Now.Millisecond);

        /// <summary>
        /// Determines whether [is null or white space].
        /// </summary>
        /// <param name="str">The string.</param>
        /// <returns>
        ///   <c>true</c> if [is null or white space] [the specified string]; otherwise, <c>false</c>.
        /// </returns>
        public static bool IsNullOrWhiteSpace(this string str)
        {
            return string.IsNullOrWhiteSpace(str);
        }

        public static string ToStringOrEmpty(this object str)
        {
            if(str != null)
            {
                return str.ToString().Trim();

            }
            return string.Empty;
        }

        /// <summary>
        ///
        /// </summary>
        /// <param name="content"></param>
        /// <returns></returns>
        public static string RemoveNewLine(this string content)
        {
            if (!string.IsNullOrWhiteSpace(content))
            {
                content = content.Replace("\n", "").Replace("\r", "").Replace("\t", "");
                return WebUtility.HtmlDecode(content);
            }
            return content;
        }

        private static readonly string[] CharVn = {
            "aAeEoOuUiIdDyY",
            "áàạảãâấầậẩẫăắằặẳẵ",
            "ÁÀẠẢÃÂẤẦẬẨẪĂẮẰẶẲẴ",
            "éèẹẻẽêếềệểễ",
            "ÉÈẸẺẼÊẾỀỆỂỄ",
            "óòọỏõôốồộổỗơớờợởỡ",
            "ÓÒỌỎÕÔỐỒỘỔỖƠỚỜỢỞỠ",
            "úùụủũưứừựửữ",
            "ÚÙỤỦŨƯỨỪỰỬỮ",
            "íìịỉĩ",
            "ÍÌỊỈĨ",
            "đ",
            "Đ",
            "ýỳỵỷỹ",
            "ÝỲỴỶỸ"
        };

        /// <summary>
        /// Removes the vn.
        /// </summary>
        /// <param name="str">The string.</param>
        /// <returns></returns>
        public static string RemoveVietnameseAccentMarks(string str)
        {
            //Proceed to replace, filter and remove the sign for the string
            try
            {
                for (int i = 1; i < CharVn.Length; i++)
                {
                    for (int j = 0; j < CharVn[i].Length; j++)
                    {
                        str = str.Replace(CharVn[i][j], CharVn[0][i - 1]);
                    }
                }
            }
            catch { }

            return str;
        }

        private static string charUserName = "1234567890qazwsxedcrfvtgbyhnujmiklopQAZWSXEDCRFVTGBYHNUJMIKLOP_";
        public static string Shuffle = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

        /// <summary>
        ///
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static string CreateUserName(string str)
        {
            //Proceed to replace, filter and remove the sign for the string
            str = RemoveVietnameseAccentMarks(str);
            StringBuilder userName = new StringBuilder();
            foreach (var item in str)
            {
                if (charUserName.Contains(item))
                {
                    userName.Append(item.ToString());
                }
            }
            return userName.ToString();
        }

        /// <summary>
        /// Creates the user name vn.
        /// VD: Nguyen Van Han = hannv
        /// </summary>
        /// <param name="str">The string.</param>
        /// <returns></returns>
        public static string CreateUserNameVN(string str)
        {
            //Proceed to replace, filter and remove the sign for the string
            var arr = str.Trim().Split(" ").Where(s => s != "" && s != null).ToList();
            var lastName = arr.LastOrDefault();
            arr.RemoveAt(arr.LastIndexOf(lastName));
            foreach (var item in arr)
            {
                lastName += " " + item[0];
            }
            str = RemoveVietnameseAccentMarks(lastName);
            StringBuilder userName = new StringBuilder();
            foreach (var item in str)
            {
                if (charUserName.Contains(item))
                {
                    userName.Append(item.ToString());
                }
            }
            return userName.ToString();
        }

        /// <summary>
        /// Numbers to string.
        /// </summary>
        /// <param name="num">The number.</param>
        /// <returns></returns>
        public static string NumberToString(long num)
        {
            var str = "";
            do
            {
                var d = num % 26;
                num = num / 26;
                d = d + 'A';
                str = $"{(char)d}{str}";
            } while (num > 0);
            return str;
        }

        /// <summary>
        ///
        /// </summary>
        /// <param name="length"></param>
        /// <returns></returns>
        public static string GenerateString(int length)
        {
            StringBuilder _return = new StringBuilder();
            for (int i = 0; i < length; i++)
            {
                var CA = ram.Next(0, 100);
                if (CA % 2 == 1)
                {
                    char c = (char)(ram.Next(0, 26) + 'A');
                    _return.Append(c.ToString());
                }
                else
                {
                    char c = (char)(ram.Next(0, 26) + 'a');
                    _return.Append(c.ToString());
                }
            }
            return _return.ToString();
        }

        /// <summary>
        /// Generate an account with your full name
        /// </summary>
        /// <param name="FullName"></param>
        /// <param name="domain">xxx.learnhub.vn</param>
        /// <param name="totalUser"></param>
        /// <returns></returns>
        public static List<string> GenerateUserName(string FullName, string domain, int totalUser = 1000)
        {
            var userName = ExtensionString.CreateUserNameVN(FullName);
            if (!string.IsNullOrWhiteSpace(userName))
            {
                if (!string.IsNullOrWhiteSpace(domain))
                {
                    domain = "@" + domain;
                }
                var userNameList = new List<string>();
                userNameList.Add($"{userName.ToLower()}{domain}");
                for (int i = 1; i < totalUser-1; i++)
                {
                    userNameList.Add($"{userName.ToLower()}{i}{domain}");
                }
                return userNameList;
            }
            return null;
        }

        /// <summary>
        /// Checkers the difference.
        /// </summary>
        /// <param name="strA">The string a.</param>
        /// <param name="strB">The string b.</param>
        /// <returns></returns>
        public static bool CheckerDiff(this string strA, string strB)
        {
            if (strA.Length != strB.Length)
            {
                return true;
            }
            for (int i = 0; i < strA.Length; i++)
            {
                if (strA[i] == strB[i])
                {
                    return false;
                }
            }
            return true;
        }
    }
}