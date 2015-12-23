set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.4965, <2> 35.8002, <3> 25.1624, <4> 47.6367, <5> 41.1427, <6> 31.3875, <7> 30.8389, <8> 27.8527, <9> 36.9341, <10> 26.4125, <11> 19.2435, <12> 7.043, <13> 47.0643, <14> 5.5769, <15> 48.7265, <16> 37.2484, <17> 22.3322, <18> 11.8088, <19> 20.3798, <20> 41.6352;
param workload[JOB] := <1> 5.4311, <2> 5.9833, <3> 5.0162, <4> 6.9019, <5> 6.4143, <6> 5.6025, <7> 5.5533, <8> 5.2776, <9> 6.0773, <10> 5.1393, <11> 4.3867, <12> 2.6539, <13> 6.8603, <14> 2.3615, <15> 6.9804, <16> 6.1031, <17> 4.7257, <18> 3.4364, <19> 4.5144, <20> 6.4525;
param capacity[MACHINE] := <1> 11.3434, <2> 11.3434, <3> 11.3434, <4> 11.3434, <5> 11.3434, <6> 11.3434, <7> 11.3434;

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
