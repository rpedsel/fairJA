set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.8, <2> 23.4999, <3> 28.219, <4> 27.2799, <5> 23.296, <6> 27.0445, <7> 31.5166, <8> 20.0253, <9> 26.7153, <10> 22.2995, <11> 25.8161, <12> 20.1366, <13> 19.457, <14> 28.2987, <15> 21.1358, <16> 16.1672, <17> 27.0743, <18> 26.984, <19> 24.5043, <20> 17.8387;
param workload[JOB] := <1> 4.98, <2> 4.8477, <3> 5.3122, <4> 5.223, <5> 4.8266, <6> 5.2004, <7> 5.614, <8> 4.475, <9> 5.1687, <10> 4.7222, <11> 5.081, <12> 4.4874, <13> 4.411, <14> 5.3197, <15> 4.5974, <16> 4.0208, <17> 5.2033, <18> 5.1946, <19> 4.9502, <20> 4.2236;
param capacity[MACHINE] := <1> 10.4848, <2> 10.4848, <3> 10.4848, <4> 10.4848, <5> 10.4848, <6> 10.4848, <7> 10.4848;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
