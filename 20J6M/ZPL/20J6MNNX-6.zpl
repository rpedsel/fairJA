set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.0849, <2> 20.3042, <3> 19.8941, <4> 27.9044, <5> 20.5983, <6> 24.6142, <7> 20.7942, <8> 9.7334, <9> 26.6373, <10> 22.8689, <11> 21.0483, <12> 17.8887, <13> 24.9232, <14> 23.7981, <15> 27.2802, <16> 25.4081, <17> 27.2509, <18> 25.6488, <19> 26.5397, <20> 21.8145;
param workload[JOB] := <1> 4.5918, <2> 4.506, <3> 4.4603, <4> 5.2825, <5> 4.5385, <6> 4.9613, <7> 4.5601, <8> 3.1198, <9> 5.1611, <10> 4.7821, <11> 4.5878, <12> 4.2295, <13> 4.9923, <14> 4.8783, <15> 5.223, <16> 5.0406, <17> 5.2202, <18> 5.0645, <19> 5.1517, <20> 4.6706;
param capacity[MACHINE] := <1> 95.022, <2> 95.022, <3> 95.022, <4> 95.022, <5> 95.022, <6> 95.022;

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
