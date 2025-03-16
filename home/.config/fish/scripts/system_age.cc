#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <ctime>
#include <string_view>
#include <utility>

int main() {
  FILE *fp = popen("head -n1 /var/log/pacman.log", "r");
  char *date_str = 0;
  uint64_t _;

  getline(&date_str, &_, fp);
  tm start_time;
  strptime(date_str, "[%FT%T%z]", &start_time);
  pclose(fp);
  free(date_str);

  time_t current_time = time(0);
  long duration = difftime(current_time, timegm(&start_time));

  auto [total_hours, age_minutes] = std::div(duration / 60, 60L);
  auto [total_days, age_hours] = std::div(total_hours, 24L);
  auto [total_months, age_days] = std::div(total_days, 61L);
  if (age_days > 30) {
    ++total_months;
    age_days -= 30;
  }
  auto [age_years, age_months] = std::div(total_months, 12L);

  int cnt = 0;
  for (auto [key, value] :
       std::initializer_list<std::pair<std::string_view, long>>{
           std::make_pair("year", age_years),
           std::make_pair("month", age_months), std::make_pair("day", age_days),
           std::make_pair("hour", age_hours),
           std::make_pair("minute", age_minutes)}) {

    if (!value)
      continue;

    printf("%s%ld %s%s", cnt++ ? ", " : "", value, key.data(),
           value > 1 ? "s" : "");

    if (cnt == 3)
      break;
  }

  puts("");
}
