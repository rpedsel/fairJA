set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.8173, <2> 24.8447, <3> 25.394, <4> 24.2959, <5> 20.4947, <6> 25.6733, <7> 28.986, <8> 26.0242, <9> 22.4404, <10> 23.8872;
param workload[JOB] := <1> 5.8635, <2> 16.3331, <3> 7.9732, <4> 0.9179, <5> 1.3625, <6> 15.3577, <7> 5.5039, <8> 8.661, <9> 10.4865, <10> 39.0314;
param capacity[MACHINE] := <1> 66.9377, <2> 66.9377, <3> 66.9377;

var x[JM] binary;
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
