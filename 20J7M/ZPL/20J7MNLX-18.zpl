set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.1362, <2> 24.729, <3> 29.979, <4> 15.9021, <5> 25.7038, <6> 28.4198, <7> 24.0293, <8> 29.7067, <9> 25.8986, <10> 31.2835, <11> 31.0442, <12> 26.1424, <13> 20.5483, <14> 35.3118, <15> 28.8898, <16> 25.5432, <17> 25.8526, <18> 19.4275, <19> 24.0373, <20> 22.2453;
param workload[JOB] := <1> 4.9129, <2> 4.9728, <3> 5.4753, <4> 3.9877, <5> 5.0699, <6> 5.331, <7> 4.902, <8> 5.4504, <9> 5.0891, <10> 5.5932, <11> 5.5717, <12> 5.113, <13> 4.533, <14> 5.9424, <15> 5.3749, <16> 5.054, <17> 5.0845, <18> 4.4077, <19> 4.9028, <20> 4.7165;
param capacity[MACHINE] := <1> 14.4978, <2> 14.4978, <3> 14.4978, <4> 14.4978, <5> 14.4978, <6> 14.4978, <7> 14.4978;

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
