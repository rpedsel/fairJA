set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.9367, <2> 24.2594, <3> 20.5401, <4> 24.0982, <5> 29.1501, <6> 28.2775, <7> 23.1735, <8> 18.5221, <9> 29.4059, <10> 18.3332, <11> 32.8366, <12> 29.1715, <13> 23.1083, <14> 20.3816, <15> 29.365, <16> 23.1163, <17> 28.4117, <18> 27.0479, <19> 21.9198, <20> 24.3701;
param workload[JOB] := <1> 28.9367, <2> 24.2594, <3> 20.5401, <4> 24.0982, <5> 29.1501, <6> 28.2775, <7> 23.1735, <8> 18.5221, <9> 29.4059, <10> 18.3332, <11> 32.8366, <12> 29.1715, <13> 23.1083, <14> 20.3816, <15> 29.365, <16> 23.1163, <17> 28.4117, <18> 27.0479, <19> 21.9198, <20> 24.3701;
param capacity[MACHINE] := <1> 72.0608, <2> 72.0608, <3> 72.0608, <4> 72.0608, <5> 72.0608, <6> 72.0608, <7> 72.0608;

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
