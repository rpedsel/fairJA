set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 40.8631, <2> 39.2156, <3> 21.1364, <4> 15.9397, <5> 37.8839, <6> 45.0086, <7> 36.1528, <8> 33.2355, <9> 32.1606, <10> 19.1393, <11> 20.4227, <12> 25.1911, <13> 5.6014, <14> 40.3727, <15> 40.2727, <16> 46.4228, <17> 35.9701, <18> 23.6606, <19> 1.003, <20> 17.1309;
param workload[JOB] := <1> 30.2959, <2> 0.4528, <3> 13.8836, <4> 45.7373, <5> 10.0562, <6> 17.603, <7> 3.751, <8> 41.2418, <9> 30.4509, <10> 31.7035, <11> 22.804, <12> 1.8194, <13> 28.5331, <14> 45.7648, <15> 6.7825, <16> 49.4451, <17> 7.9088, <18> 34.7102, <19> 11.4639, <20> 31.6419;
param capacity[MACHINE] := <1> 49.9339, <2> 49.9339, <3> 49.9339, <4> 49.9339, <5> 49.9339, <6> 49.9339, <7> 49.9339;

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
