set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.229, <2> 26.0518, <3> 21.1356, <4> 22.822, <5> 22.9399, <6> 22.6616, <7> 37.7491, <8> 28.1296, <9> 22.931, <10> 26.8648, <11> 27.6683, <12> 21.8503, <13> 16.8717, <14> 25.4165, <15> 14.8443, <16> 17.3158, <17> 26.9116, <18> 20.393, <19> 24.1235, <20> 35.4894;
param workload[JOB] := <1> 2.1502, <2> 23.9842, <3> 43.5554, <4> 13.4023, <5> 14.569, <6> 9.5766, <7> 6.6203, <8> 24.0265, <9> 49.5732, <10> 17.8978, <11> 40.7261, <12> 15.1095, <13> 16.7315, <14> 7.0858, <15> 41.1639, <16> 46.687, <17> 17.3712, <18> 16.9058, <19> 10.5255, <20> 1.4315;
param capacity[MACHINE] := <1> 59.8705, <2> 59.8705, <3> 59.8705, <4> 59.8705, <5> 59.8705, <6> 59.8705, <7> 59.8705;

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
