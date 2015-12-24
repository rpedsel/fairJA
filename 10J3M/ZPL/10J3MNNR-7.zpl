set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.4928, <2> 21.0953, <3> 25.5058, <4> 25.9798, <5> 23.7167, <6> 21.5836, <7> 30.0349, <8> 20.8816, <9> 31.0596, <10> 18.7681;
param workload[JOB] := <1> 37.0343, <2> 36.5568, <3> 35.0012, <4> 6.9041, <5> 38.602, <6> 5.4142, <7> 28.3724, <8> 23.6696, <9> 40.1899, <10> 14.9144;
param capacity[MACHINE] := <1> 266.6589, <2> 266.6589, <3> 266.6589;

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
