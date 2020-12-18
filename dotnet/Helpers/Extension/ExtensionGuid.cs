using System;

namespace WebApi.Helpers.Extension
{
    public static class ExtensionGuid
    {
        /// <summary>
        /// To the guid identifier.
        /// </summary>
        /// <param name="strGuid">The string guid identifier.</param>
        /// <returns></returns>
        public static Guid ToGuid(this string strGuid)
        {
            if (!string.IsNullOrWhiteSpace(strGuid))
            {
                Guid.TryParse(strGuid.Trim(), out Guid _return);
                return _return;
            }
            return Guid.Empty;
        }

        public static Guid? ToGuidOrNull
            (string guid)
        {
            if (!string.IsNullOrWhiteSpace(guid))
            {
                Guid.TryParse(guid.Trim(), out Guid _return);
                return _return;
            }
            return null;
        }

        /// <summary>
        ///
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static string ToStringOrEmpty(this Guid id)
        {
            if (id != Guid.Empty || id != null)
            {
                return id +"";
            }
            return string.Empty;
        }

        /// <summary>
        /// Trims the guid identifier.
        /// </summary>
        /// <param name="strGuid">The string guid identifier.</param>
        /// <returns></returns>
        public static string TrimGuid(this string strGuid)
        {
            if (!string.IsNullOrWhiteSpace(strGuid))
            {
                strGuid = strGuid.Trim();
            }
            if (Guid.TryParse(strGuid, out Guid _return))
            {
                return _return +"";
            }
            return "";
        }

        /// <summary>
        /// Checks the guid identifier.
        /// </summary>
        /// <param name="strGuid">The string guid identifier.</param>
        /// <returns></returns>
        public static bool CheckGuid(this string strGuid)
        {
            string s = TrimGuid(strGuid);
            return (!string.IsNullOrWhiteSpace(s) && s != Guid.Empty.ToString());
        }
    }
}
