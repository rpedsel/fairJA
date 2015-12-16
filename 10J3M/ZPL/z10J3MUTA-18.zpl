set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 12.1, <2> 5.7386, <3> 35.0111, <4> 46.136, <5> 48.1779, <6> 3.1545, <7> 17.1157, <8> 20.8297, <9> 25.5883, <10> 18.7999;
param workload[JOB] := <1> 146.41, <2> 32.9315, <3> 1225.7771, <4> 2128.5305, <5> 2321.11, <6> 9.9509, <7> 292.9472, <8> 433.8764, <9> 654.7611, <10> 353.4362;
param capacity[MACHINE] := <1> 1899.9327, <2> 1899.9327, <3> 1899.9327;

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
