set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 5.8676, <2> 21.1421, <3> 32.8875, <4> 30.7228, <5> 11.3344, <6> 32.1517, <7> 33.2088, <8> 2.3888, <9> 45.2851, <10> 32.4249, <11> 12.7024, <12> 24.3664, <13> 39.7444, <14> 26.7492, <15> 35.4995, <16> 33.9203, <17> 39.1557, <18> 48.4546, <19> 7.7471, <20> 22.0343;
param workload[JOB] := <1> 2.4223, <2> 4.5981, <3> 5.7348, <4> 5.5428, <5> 3.3667, <6> 5.6702, <7> 5.7627, <8> 1.5456, <9> 6.7294, <10> 5.6943, <11> 3.564, <12> 4.9362, <13> 6.3043, <14> 5.172, <15> 5.9581, <16> 5.8241, <17> 6.2575, <18> 6.9609, <19> 2.7834, <20> 4.6941;
param capacity[MACHINE] := <1> 14.2174, <2> 14.2174, <3> 14.2174, <4> 14.2174, <5> 14.2174, <6> 14.2174, <7> 14.2174;

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
